package lapp

class SendMailService {

	static transactional = true

	def sendPassword(password, user, email) {
    	sendMail {
            to email
            subject "Bienvenidos a la app"
            body (view:"/user/email", model:[pass:password, user:user])
         }
    }
}
