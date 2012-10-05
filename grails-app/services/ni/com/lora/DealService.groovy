package ni.com.lora

class DealService {

    def isPublished(dealInstance) {
    	return (dealInstance.published) ? true : false
    }

    def areValidDates(fromDate, toDate, claimFrom, claimUp) {
    	def today = new Date()

    	return (((fromDate > today) && (toDate > fromDate)) && (claimFrom > toDate) && (claimUp > claimFrom)) ? true : false
    }

    def updateQuantity(deal,quantity) {
    	def dealInstance = Deal.get(deal)
        def result = dealInstance.itemsToSale - quantity.toInteger()

        if(result >= 0) {
            dealInstance.itemsToSale = result
            
            if(result == 0) {
                dealInstance.state = false
            }

            return (dealInstance.save(flush:true)) ? true : false
        }

    	return false
    }

    def show(deal,company) {
        def dealInstance = Deal.findByCompanyAndId(Company.get(company),deal)

        return (dealInstance) ?: false
    }
}
