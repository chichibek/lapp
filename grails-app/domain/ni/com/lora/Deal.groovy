package ni.com.lora

class Deal {
	String product
	Double price
	Integer itemsToSale
	Date fromDate
	Date toDate
	Date claimFrom
	Date claimUp
	String description
	Boolean published = false
	Boolean state = true //closed deals
    Boolean closed = false //not used
	String gender = 'all'
	String age = 'all'
	Date dateCreated
	Date lastUpdated

    static constraints = {
    	product blank:false
    	price blank:false
    	itemsToSale blank:false
    	fromDate blank:false
    	toDate blank:false
    	claimFrom blank:false
    	claimUp blank:false
    	gender inList:['all','male','female']
    	age inList:['all','child','young','adult','young and adult'], blank:false
    	description blank:false, maxSize:10000
    }

    String toString() {
    	product
    }

    static mapping = {
        subsidiaries sort:'dateCreated'
    }

    static belongsTo = [company:Company]

    static hasMany = [subsidiaries:Subsidiary, buys:Buy]

    static namedQueries = {
        all {
            eq 'published', true
            and {
                eq 'state', true
            }
        }
    }

}