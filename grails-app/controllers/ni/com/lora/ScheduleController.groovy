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
    	
    }
}
