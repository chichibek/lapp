package ni.com.lora

class User {

	String userName
    String email
    String address
    String identityCard
	String password
	String role = 'user'
	Boolean enabled = true
	Date dateCreated
	Profile profile

    static constraints = {
    	userName blank:false, unique:true
        email blank:false, email:true, unique:true
        address blank:false
        identityCard blank:false, unique:true
    	password blank:false, password:true
    	role inList:['admin','user','client']
    	profile nullable:true
    }

    static mapping = {
    	profile lazy:false
    }

    static hasMany = [companies:Company, buys:Buy]

    def beforeInsert() {
        enabled = (role == 'user') ? false : true
        if(role == 'admin' || role == 'client') {
            password = userName
        }
    	password = password.encodeAsSHA1()
    }

    String toString() {
    	userName
    }
    
    Boolean isAdmin() {
    	return role == 'admin'
    }

    Boolean isUser() {
    	return role == 'user'
    }

    Boolean isClient() {
    	return role == 'client'
    }

}