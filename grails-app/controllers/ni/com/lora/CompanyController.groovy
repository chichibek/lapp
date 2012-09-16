package ni.com.lora

class CompanyController {

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
    	[companyInstanceList:Company.list(),companyInstanceTotal:Company.count()]
    }

    def create() {
    	[companyInstance:new Company(params)]
    }

    def save() {
        def companyInstance = new Company(params)

        if(!companyInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            render(view:'create',model:[companyInstance:companyInstance])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'create')
    }

    def show() {
    	def companyInstance = Company.get(params.id)

    	if(!companyInstance) {
    		flash.message = message(code:'ni.com.lora.notFound',args:[params.id])
    		redirect(action:'list')
    		return false
    	}

    	[companyInstance:companyInstance]
    }

    def update() {
    	def companyInstance = Company.get(params.id)

		if(!companyInstance) {
    		flash.message = message(code:'ni.com.lora.notFound',args:[params.id])
    		redirect(action:'list')
    		return false
    	}

    	companyInstance.properties = params

    	if(!companyInstance.save(flush:true)) {
    		flash.message = message(code:'ni.com.lora.error')
    		render(view:'show',model:[companyInstance:companyInstance,id:params.id])
    	}

    	flash.message = message(code:'ni.com.lora.success')
    	redirect(action:'show',params:[id:params.id])
    }

    def delete() {
    	def companyInstance = Company.get(params.id)
		
		if(!companyInstance) {
    		flash.message = message(code:'ni.com.lora.notFound',args:[params.id])
    		redirect(action:'list')
    		return false
    	}

    	try {
    		companyInstance.delete(flush:true)    		
    	}catch(org.springframework.dao.DataIntegrityViolationException e) {
    	    flash.message = message(code:'ni.com.lora.error')
    	}

    	redirect(action:'list')
    }
}
