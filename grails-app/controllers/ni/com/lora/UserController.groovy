package ni.com.lora

class UserController {
    def userService

    static defaultAction = 'login'

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
    	redirect(controller:'panel')
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

}
