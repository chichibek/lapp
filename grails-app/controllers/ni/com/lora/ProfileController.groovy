package ni.com.lora

class ProfileController {

    static defaultAction = 'profile'

    def profile() {
    	[userProfileInstance:session?.user?.profile]
    }

    def updateProfile() {
    	def userProfileInstance = session?.user?.profile
    	params.birthDay = (params.birthDay) ? new Date().parse('yyyy-MM-dd',params.birthDay) : null

    	userProfileInstance.properties = params

    	flash.message = (userProfileInstance.save(flush:true)) ? message(code:'ni.com.lora.success') : message(code:'ni.com.lora.error')
    	chain(action:'profile',model:[userProfileInstance:userProfileInstance])
    }
}
