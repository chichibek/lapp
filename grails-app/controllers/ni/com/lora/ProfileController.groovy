package ni.com.lora

class ProfileController {

    static defaultAction = 'profile'

    def profile() {
    	[userProfileInstance:session?.user?.profile]
    }

    def updateProfile() {
    	def userProfileInstance = session?.user?.profile
    	params.birthDay = (params.birthDay) ? new Date().parse('yyyy-MM-dd',params.birthDay) : null

    	if(params.avatar.isEmpty()) {
    		userProfileInstance.properties['fullName','gender','birthDay','city'] = params
    	}else{
    		userProfileInstance.properties['avatar','fullName','gender','birthDay','city'] = params
    	}

    	flash.message = (userProfileInstance.save(flush:true)) ? message(code:'ni.com.lora.success') : message(code:'ni.com.lora.error')

    	chain(action:'profile',model:[userProfileInstance:userProfileInstance])
    }

    def renderAvatar() {
    	def profileInstance = Profile.get(session?.user?.profile?.id)

		response.setContentLength(profileInstance.avatar.length)
		response.outputStream.write(profileInstance.avatar)
    }

    def unlinkAvatar() {
		def profileInstance = Profile.get(session?.user?.profile?.id)

		profileInstance.properties['avatar'] = null
		flash.message = (profileInstance.save(flush:true)) ? message(code:'ni.com.lora.success') : message(code:'ni.com.lora.error')

		redirect(action:'profile')		    	
    }

}
