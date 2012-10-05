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

    deal {
        dependsOn 'jquery'
        resource url:'js/sisyphus.js'
        resource url:'js/deal.js'
    }

    companiesList {
        dependsOn 'common'
        resource url:'css/foundation.min.css'
    }

    list {
        resource url:'js/bootstrap-tooltip.js'
        resource url:'js/bootstrap-popover.js'
        resource url:'js/popover-scenario.js'
    }
}