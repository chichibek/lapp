package ni.com.lora

class UserController {
    def userService
    def beforeInterceptor = [action:this.&validate, only:['edit']]

    static defaultAction = 'login'

    private validate() {
        if(session?.user?.role == 'admin' && params.role == 'user') {
            flash.message = message(code:'ni.com.lora.accessdenied')
            redirect(action:'list',params:[role:params.role])
            return false
        }

        if(params.role == 'user' || params.role == 'admin') {
            flash.message = message(code:'ni.com.lora.notcompany')
            redirect(action:'list',params:[role:params.role])
            return false
        }
    }

    def login() { }

    def authenticate() {
        def query = User.where {
            (userName == params.userName || email == params.userName) && (password == params.password.encodeAsSHA1() && enabled == true)
        }
        def userInstance = query.find()

    	if(!userInstance) {
    		flash.message = message(code:'ni.com.lora.wrongcredentials')
    		redirect(action:'login')
    		return false
    	}

    	session.user = userInstance
        switch(session?.user?.role) {
            case 'admin':
                redirect(action:'list')    
                break
            case 'client':
                redirect(controller:'company', action:'list', params:[id:userInstance?.id])
                break
            case 'user':
                if(params.deal) {
                    redirect(controller:'deal', action:'featured', params:[id:params.deal, quantity:params.quantity])
                }else{
                    redirect(controller:'buy', action:'list')
                }
                break
        }
    }

    def logout() {
    	session.user = null
    	redirect(action:'login')
    }

    def signin() {
        def userInstance = new User(params)
        
        if(userInstance.save(flush:true)) {
            flash.message = message(code:"ni.com.lora.success")
        }else{
            flash.message = message(code:"ni.com.lora.error")
            chain(action: "login", model: [userInstance:userInstance])
        }

        redirect(action:"login")
    }

    def password() { }

    def updatePassword() {
        def userInstance = User.get(session?.user?.id)

        if(params.apassword.encodeAsSHA1() == session?.user?.password && params.password == params.rpassword) {
            userInstance.properties['password'] = params.password.encodeAsSHA1()
            flash.message = (userInstance.save(flush:true)) ? message(code:'ni.com.lora.success') : message(code:'ni.com.lora.error')
        }

        chain(action:'password',model:[userInstance:userInstance])
    }

    def account() { }

    def updateAccount() {
        def userInstance = User.get(session?.user?.id)

        userInstance.properties['userName','email'] = params
        if(userInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.success')
            session?.user = userInstance
        }else{
            flash.message = message(code:'ni.com.lora.error')
        }

        chain(action:'account',model:[userInstance:userInstance])
    }

    def create() {
        [userInstance: new User(params)]
    }
        
    def save() {
        if(params.role == 'client') {
            params.password =  new Random().nextInt(9999999)
        }

        def userInstance = new User(params)

        if(!userInstance.save(flush:true)){
            flash.message = message(code:'ni.com.lora.error')
            render(view:"create", model:[userInstance:userInstance, role:params.role])
            return false
        }

        userInstance.save(flush:true)
        //def email = sendMailService.sendPassword(params.password, params.userName, params.email)
        flash.message = message(code:"ni.com.lora.success")
        redirect(action:"list", params:[role:params.role])
    }

    def list() {
        def userInstanceList

        switch(params.role) {
            case 'user':
                userInstanceList = User.findAllByRole('user',[sort:'dateCreated',order:'desc'])
                break
            case ['client',null]:
                userInstanceList = User.findAllByRole("client")
                break
            case 'admin':
                userInstanceList = User.findAllByRole("admin")
                break
        }

        [userInstanceList:userInstanceList]
    }

    def changeEnabledState() {
        def userInstance = User.get(params.id)

        if(!userInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list',params:[role:'user'])
            return false
        }

        userInstance.properties['enabled'] = (!userInstance.enabled) ? true : false

        if(!userInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            redirect(action:'list',params:[role:params.role])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'list',params:[role:params.role])
    }

    def edit() {
        def userInstance = User.get(params.id)
        [userInstance:userInstance]
    }

    def update() {
        def userInstance = User.get(params.id)

        if(!userInstance){
            flash.message = message(code:'ni.com.lora.notfound')
        }else{
            userInstance.properties = params

            if(!userInstance.save(flush:true)){
                flash.message = message(code:'ni.com.lora.error')
                render(view:"edit", model:[userInstance:userInstance], params=[id:params.id, role:params.role])
                return false
            }else{
                flash.message = message(code:'ni.com.lora.success')  
            }
        }

        redirect(action:'list', params:[role:params.role])
    }

    def showClient() {
        //params.userName is used if this action is called from listNewBuys
        def userInstance = (params.id) ? User.get(params.id) : User.findByUserName(params.userName)

        if(!userInstance){
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:"list", params:[role:params.role])
            return false
        }
            
        [userInstance:userInstance]
    }

    def delete() {
        def userInstance = User.get(params.id)

        if(!userInstance){
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:"list", params:[role:params.role])
            return false
        }else{
            try {
                userInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message')
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message')
                redirect(action: "showClient", params:[id:params.id, role:params.role])
            }
        }
    }

    def getUserInfo() {
        def userInstance = User.findByUserName(params.user.toString())

        switch(params.flag) {
            case 'address':
                render userInstance.address
                break
            case 'email':
                render userInstance.email
                break
            case 'identityCard':
                render userInstance.identityCard
                break
        }
        
    }

    def countNewUsers() {
        def userInstanceList = User.findAllByRoleAndEnabled('user', false)
        render userInstanceList.size()
    }

    //public
    def reset() {

    }

}
