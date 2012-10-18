package ni.com.lora

class CompanyController {
    def avatarService
    
    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
        //TODO:fix this problem in user role client when hi/she try to change id it get other user client company
        def userInstance = User.get(params.id)

        if(!userInstance || userInstance.role != 'client') {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(controller:'user', action:'list')
            return false
        }

        [companyInstance:Company.findAllByUser(userInstance, [sort:'dateCreated',order:'desc']), userInstance:userInstance]        
    }

    def create() {
    	[companyInstance:new Company(params), userInstance: User.get(params.id)]
    }

    def save() {
        def companyInstance = new Company(params)

        if(!companyInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            render(view:'create',model:[companyInstance:companyInstance])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'show', params:[id:companyInstance.ident()])
    }

    def show() {
    	def companyInstance = Company.get(params.id)

    	if(!companyInstance) {
    		flash.message = message(code:'ni.com.lora.notfound',args:[params.id])
    		redirect(action:'list')
    		return false
    	}

    	[companyInstance:companyInstance]
    }

    def edit(){
        def companyInstance = Company.get(params.id)
        [companyInstance:companyInstance]
    }

    def update() {
    	def companyInstance = Company.get(params.id)
        def file = request.getFile('logo')

        if(!companyInstance) {
            flash.message = message(code:'ni.com.lora.notfound',args:[params.id])
            redirect(action:'list')
            return false
        }
        
        if(params.logo.isEmpty()){
            companyInstance.properties['name', 'manager', 'telephone', 'companyService', 'email', 'url'] = params
        }else{
            if(avatarService.isValid(file)) {
                companyInstance.properties = params
            }else{
                flash.message = message(code:'ni.com.lora.error')
                render(view:'edit',model:[productInstance:productInstance,params:[id:params.id,company:params.company.id]])
                return false    
            }
        }

        if(!companyInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            render(view:'show',model:[companyInstance:companyInstance,id:params.id])
        }else{
            flash.message = message(code:'ni.com.lora.success')
            redirect(action:'show',params:[id:params.id])
        }
    }

    def renderLogo(){
        def companyInstance = Company.get(params.id)
        
        response.setContentLength(companyInstance.logo.length)
        response.outputStream.write(companyInstance.logo)
    }

    def delete() {
    	def companyInstance = Company.get(params.id)
		
		if(!companyInstance) {
    		flash.message = message(code:'ni.com.lora.notfound',args:[params.id])
    		redirect(action:'list')
    		return false
    	}

    	try {
    		companyInstance.delete(flush:true)    		
    	}catch(org.springframework.dao.DataIntegrityViolationException e) {
    	    flash.message = message(code:'ni.com.lora.error')
    	}

        flash.message = message(code:'ni.com.lora.success')
    	redirect(action:'list')
    }

    //public   
    def companiesList() {
        [companyInstanceList:Company.list(), companies: new Company(params)]
    }

    //k code
    def companiesByCategory(){    
        def companyInstanceList = Company.findAllByCompanyService(params.companyService)
        if(!companyInstanceList){
            flash.message= message(code:'ni.com.lora.notfound')
            redirect(action:"companiesList")
            return false
        }else{
            [companyInstanceList:companyInstanceList, companies: new Company(params)]
        }
    } 

}
