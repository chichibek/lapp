package ni.com.lora

class Product {

	String name
	Double price
	byte[] avatar
	Date dateCreated

    static constraints = {
    	name blank:false
    	price blank:false
    	avatar nullable:true, maxSize:250000
    }

    static belongsTo = [company:Company]

    String toString() {
    	name
    }

}
