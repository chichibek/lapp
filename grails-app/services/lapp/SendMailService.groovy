package lapp

class SendMailService {

	boolean transactional = false

	def sendPassword(password, user, email) {
    	

    	sendMail {
            to email
            subject "Bienvenidos a la app"
            body (view:"/user/email", model:[pass:password, user:user])
         }   


    }
}
