package ni.com.lora

class Buy {

	Boolean paid = false
	Integer quantity = 1
	Date dateCreated

    static constraints = {
    	paid()
    	quantity()
    	user()
    	deal()
    }

    def getDaysOfBuy() {
        def today = new Date()
        def result = today - dateCreated
    
        return result
    }

    static belongsTo = [user:User, deal:Deal]
}
