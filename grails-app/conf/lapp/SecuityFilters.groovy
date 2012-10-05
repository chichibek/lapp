package lapp

class SecuityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                def publicActions = ['login','authenticate','signin','logout','featured','renderProductAvatar','getMoneySaved','getPercentageSaved','setBuy','all','companiesList','renderLogo','reset']
                if(!session?.user && !publicActions.contains(actionName)) {
                    redirect(controller:'user')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
