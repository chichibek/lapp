package ni.com.lora

class ScheduleController {

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
        /*
        TODO:check issue whit this action. i.e if user client in address bar type another company id 
        it will get the other company information, if the user client repit this action whit a not valid 
        id it will redicert to admin page
        */
        def companyInstance = Company.get(params.id)
        def scheduleInstanceList = Schedule.findAllByCompany(companyInstance)
        [scheduleInstanceList:scheduleInstanceList,scheduleInstanceTotal:scheduleInstanceList.size(), companyInstance:companyInstance]
    }

    def renderLogo() {
        //TODO:this action must be a service
        def companyInstance = Company.get(params.id)
        response.setContentLength(companyInstance.logo.length)
        response.outputStream.write(companyInstance.logo)
    }

    def create() {
    	[scheduleInstance:new Schedule(params)]
    }

    def save() {
    	def scheduleInstance = new Schedule(params)

    	if(!scheduleInstance.save(flush:true)) {
    		flash.message = message(code:'ni.com.lora.error')
    		chain(action:'create', model:[scheduleInstance:scheduleInstance], params:[id:params.id])
   			return false
    	}

    	flash.message = message(code:'ni.com.lora.success')
    	redirect(action:'create',params:[id:params.id])
    }

    def show() {
    	def scheduleInstance = Schedule.get(params.id)

    	if(!scheduleInstance) {
    		flash.message = message(code:'ni.com.lora.notFound',args:[params.id])
    		redirect(action:'list',params:[id:params.company])
    		return false
    	}

    	[scheduleInstance:scheduleInstance]
    }

    def update() {
    	def scheduleInstance = Schedule.get(params.id)

    	scheduleInstance.properties = params

        if(!scheduleInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            chain(action:'show', model:[scheduleInstance:scheduleInstance], params:[id:params.id,company:params.company.id])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'show', params:[id:params.id,company:params.company.id])
    }

    def delete() {
        def scheduleInstance = Schedule.get(params.id)

        if(!scheduleInstance) {
            flash.message = message(code:'ni.com.lora.notfound',args:[params.id])
        }else{
            scheduleInstance.delete(flush:true)
            flash.message = message(code:'ni.com.lora.success')
        }

        if(params?.company) {
            redirect(action:'list',params:[id:params.company])
        }else{
            redirect(controller:'company')
        }
    }

}
