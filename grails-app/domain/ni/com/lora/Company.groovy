package ni.com.lora

class Company {

	String name
    String manager
	byte[] logo
	String telephone
	String email
    String companyService = 'shoes'
	Date dateCreated

    static constraints = {
    	name unique:true, blank:false
        manager nullable:true
    	logo nullable:true, maxSize:240000
        companyService inList:['shoes','fast food','hardware store','restaurant','super market']
    	telephone nullable:true, unique:true
    	email nullable:true, email:true, unique:true
    }

    String toString() {
    	name
    }
    
    static belongsTo = [user:User]

    static hasMany = [products:Product,branches:Branch,deals:Deal,schedules:Schedule]

}
