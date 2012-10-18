package ni.com.lora

class Company {

	byte[] logo
    String name
    String manager
	String telephone
	String email
    String url
    String companyService = 'shoes'
	Date dateCreated

    static constraints = {
    	logo nullable:true, maxSize:240000
        name unique:true, blank:false
        manager nullable:true
        companyService inList:['shoes','fast food','hardware store','restaurant','super market']
    	telephone nullable:true, unique:true
    	email nullable:true, email:true, unique:true
        url url:true, unique:true, nullable:true
    }

    String toString() {
    	name
    }
    
    static belongsTo = [user:User]

    static hasMany = [products:Product,branches:Branch,deals:Deal,schedules:Schedule]

}
