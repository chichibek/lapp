package ni.com.lora

//cuando enabled se haga true state es true 
//debera haber un job verificando si una deal activa esta a pocos dias de cerrar y una vez llegada 
//la fecha de cierre debera pasar state a off

class Deal {

	String product
	Double price
	Integer counter//how many deals are available!
	Date fromDate
	Date toDate
	Date fromToClaim
	Date toToClaim
	String comment
	Boolean enabled = false
	Boolean state
	String gender
	String age = 'all'
	String sede
	String user
	Date dateCreated

    static constraints = {
    	company blank:false
    	product blank:false
    	counter nullable:true
    	price blank:false
    	comment blank:false
    	gender inList:['male','female','unisex']
    	age inList:['child','young','adult','young and adult','all']//is another entity a better solution?
    }

    String toString() {
    	product
    }

    static belongsTo = [company:Company]

    static hasMany = [subsidiaries:Subsidiary]

}
