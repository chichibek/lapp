package ni.com.lora

class LappJob {
    static triggers = {
     	cron name:'cronTrigger', cronExpression:'0 0 0 * * ?'
    }

    def execute() {
        def query = Deal.createCriteria()
		//def today = new Date().parse('yyyy-MM-dd','2012-10-01')
		def today = new Date()

		def result = query {
			lt('toDate',today)
		}

		if(result) {
			result.each {
				it.properties['state'] = false
				it.save(flush:true)
			}
		}
    }
}
