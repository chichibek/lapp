package ni.com.lora

class ScheduleController {

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
    	def scheduleInstanceList = Schedule.findAllByCompany(Company.get(params.id))
    	[scheduleInstanceList:scheduleInstanceList,scheduleInstanceTotal:scheduleInstanceList.size()]
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
