package ni.com.lora

class BranchController {

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
        def companyInstance = Company.get(params.id)
    	def branchInstanceList = Branch.findAllByCompany(companyInstance)
    	[branchInstanceList:branchInstanceList,companyInstance:companyInstance]
    }

    def create() {
    	[branchInstance: new Branch(params)]
    }

    def save() {
    	def branchInstance = new Branch(params)

    	if(!branchInstance.save(flush:true)) {
    		flash.message = message(code:'ni.com.lora.error')
            chain(action:'create', model:[branchInstance:branchInstance], id:params.company.id)
    		return false
    	}

    	flash.message = message(code:'ni.com.lora.success')
    	redirect(action:'create',params:[id:params.company.id])
    }

    def show() {
        def companyInstance = Company.get(params.company)
    	def branchInstance = Branch.get(params.id)

    	if(!branchInstance) {
    		flash.message = message(code:'ni.com.lora.notfound')
    		render(view:'show',model:[branchInstance:branchInstance],params:[id:params.id,company:params.company])
    		return false
    	}

    	[branchInstance:branchInstance, companyInstance:companyInstance, company:params.company]
    }

    def edit() {
        def branchInstance = Branch.get(params.id)

        if(!branchInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            render(view:'show',model:[branchInstance:branchInstance],params:[id:params.id,company:params.company])
            return false
        }

        [branchInstance:branchInstance]
    }

    def update() {
        def branchInstance = Branch.get(params.id)

        if(!branchInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            chain(action:'edit', model:[branchInstance:branchInstance], params:[id:params.id,company:params.company.id])
            return false   
        }

        branchInstance.properties = params

        if(!branchInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            chain(action:'edit', model:[branchInstance:branchInstance], params:[id:params.id,company:params.company.id])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'edit', params:[id:params.id,company:params.company.id])
    }

    def delete() {
        def branchInstance = Branch.get(params.id)

        if(!branchInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list',params:[id:params.company])
            return false
        }

        try {
            branchInstance.delete(flush:true)   
            flash.message = message(code:'ni.com.lora.success')       
        }catch(org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = message(code:'ni.com.lora.error')
        }

        redirect(action:'list',params:[id:params.company])
    }

    def renderlogo(){
        def companyInstance = Company.get(params.id)
        response.setContentLength(companyInstance.logo.length)
        response.outputStream.write(companyInstance.logo)
    }

}
