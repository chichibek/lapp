package ni.com.lora

class UserService {

	static transactional = true

    def signin(fullName,email,password) {
    	def profileInstance = new Profile(fullName:fullName)
        def userInstance = new User(email:email,password:password,profile:profileInstance)

        if(!profileInstance.save(flush:true)) {
            return false
        }else{
            if(!userInstance.save(flush:true)) {
                return false
            }else{
                return true
            }
        }
    }

    def isValidUser(user) {
        //an user is valid if he has full name, address, email, personal id (cedula)
        
    }
}
