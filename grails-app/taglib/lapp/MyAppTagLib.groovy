package lapp

class MyAppTagLib {

	static namespace = "lapp"

	def flashMessage = { attrs,body ->
		if(flash.message) {
			out << "<div class='alert'>"
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

	def renderAvatar = { attrs,body ->
		if(attrs.profile) {
			out << "<img src='${createLink(controller:'profile', action:'renderAvatar')}'>"
		}
	}
}
