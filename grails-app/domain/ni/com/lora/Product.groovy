package ni.com.lora

class Product {

	String name
	Double price
	byte[] image
	Date dateCreated

    static constraints = {
    	name blank:false
    	price blank:false
    	image nullable:true, maxSize:240000
    }

    static belongsTo = [company:Company]

    String toString() {
    	name
    }

}
