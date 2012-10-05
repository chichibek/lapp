package ni.com.lora

class Subsidiary {

	String name
	Date dateCreated

    static constraints = {
    	name nullable:true
    }

    static belongsTo = [deal:Deal]
}
