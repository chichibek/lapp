package ni.com.lora

class Subsidiary {

	String name

    static constraints = {
    	name nullable:true
    }

    static belongsTo = [deal:Deal]
}
