package lapp

class MyAppTagLib {

	static namespace = "lapp"

	def flashMessage = { attrs,body ->
		if(flash.message) {
			out << "<div class='alert alert-info'>"
			out << flash.message
			out << "</div>"
		}
	}

	def isAdmin = { attrs,body ->
		if(session?.user?.role == 'admin') {
			out << body()
		}
	}

	def isClient = { attrs,body ->
		if(session?.user?.role == 'client') {
			out << body()
		}
	}

	def isUser = { attrs,body ->
		if(session?.user?.role == 'user') {
			out << body()
		}
	}

	def isEnabled = { attrs,body -> 
		if(attrs.state) {
			out << message(code:'ni.com.lora.yes')
		}else{
			out << message(code:'ni.com.lora.no')
		}
	}

	def isPublished = { attrs,body -> 
		if(attrs.state) {
			out << message(code:'ni.com.lora.yes')
		}else{
			out << message(code:'ni.com.lora.no')
		}
	}

	def isPaid = { attrs, body ->
		if(attrs.paid) {
			//out << "<span class='label label-important'>"
			out << message(code:'ni.com.lora.paid')
			//out << "</span>"
		}else{
			//out << "<span class='label label-info'>"
			out << message(code:'ni.com.lora.notpaid')
			//out << "</span>"
		}
	}

	def renderAvatar = { attrs,body ->
		if(attrs.instance) {
			out << "<img src='${createLink(action:'renderAvatar', id:'attrs.id')}'>"
		}
	}

	def loginControl = {
		if(request.getSession(false) && session?.user){
			out << "Hello ${session?.user?.userName} "
			out << """[${link(action:"logout", controller:"user"){"Logout"}}]"""
		} else {
			out << """[${link(action:"login", controller:"user"){"Login"}}]"""
		}
	}

	def dealState = { attrs, body ->
		if(attrs.state) {
			out << "<span class='label label-info'>"
			out << message(code:'ni.com.lora.open')
			out << "</span>"
		}else{
			out << "<span class='label label-warning'>"
			out << message(code:'ni.com.lora.close')
			out << "</span>"
		}
	}

	def isDealClosed = {attrs, body ->
		if(!attrs.state){
			out << body()	
		}
	}
}