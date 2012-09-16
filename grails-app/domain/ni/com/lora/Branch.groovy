package ni.com.lora

class Branch {

	String name
	String manager
	String address
	String telephone
	String email
	Date dateCreated

    static constraints = {
    	name blank:false,unique:true
    	manager nullable:true
    	address blank:false, unique:true
    	telephone nullable:true, unique:true
    	email nullable:true, email:true, unique:true
    }

    String toString(){
    	name
    }

    static belongsTo = [company:Company]

}
