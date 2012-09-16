modules = {
    application {
        resource url:'js/application.js'
    }

    common {
    	resource url:'css/bootstrap.css'
    	resource url:'css/app.css'
    	resource url:'css/bootstrap-responsive.css'
    }

    commonJS {
    	dependsOn 'jquery'
    	resource url:'js/bootstrap-dropdown.js'
    }
}