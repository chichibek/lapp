package ni.com.lora

class Branch {

	String name
	String address
    String manager
	String telephone
	String email
	Date dateCreated

    static constraints = {
    	name unique:true, nullable:true
    	address blank:false, unique:true
        manager nullable:true
    	telephone nullable:true, unique:true
    	email nullable:true, email:true, unique:true
    }

    String toString(){
    	name
    }

    def beforeInsert = {
        name = company.name + " " + address
    }

    def beforeUpdate = {
        name = company.name + " " + address
    }

    static belongsTo = [company:Company]

}
