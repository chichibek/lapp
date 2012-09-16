package ni.com.lora

class Company {

	String name
    String manager
	byte[] logo
	String address
	String telephone
	String email
	Date dateCreated

    static constraints = {
    	name unique:true, blank:false
        manager nullable:true
    	logo nullable:true, maxSize:240000
    	address nullable:true, unique:true
    	telephone nullable:true, unique:true
    	email nullable:true, email:true, unique:true
    }

    String toString() {
    	name
    }

    static mapping = {
    	products sort:'dateCreated'
    	deals sort:'dateCreated'
    }

    static belongsTo = [user:User]

    static hasMany = [products:Product,branches:Branch,deals:Deal,schedules:Schedule]

}
