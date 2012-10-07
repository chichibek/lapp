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

        //company:create|edit|show|delete|save|update|renderLogo|companiesList
        //branch:create|save|edit|show|update|delete|render*
        //product:create|save|edit|show|update|delete|render*|getMoneySaved|getPercentageSaved
        //schedule:create|save|edit|show|update|delete
        //user:create|save|change|edit|update|show*|delete|get*
        //deal:is*|create|save|show|update|delete|change*|close|detail|listClosed*|listClosed*
        //buy:show|change*|total*
        onlyAdmin(controller:'*',action:'(create|edit|show|delete|save|update|render*|companies*|get*|is*|change*|close|detail|listClosed*|total*)') {
            before = {
                if(session?.user) {
                    def role = session?.user?.role

                    switch(role) {
                        case 'client':
                            redirect(controller:'company', action:'list', id:session?.user?.id)
                            break
                        case 'user':
                            redirect(controller:'buy', action:'list')
                            break
                    }

                    return false
                }        
            }
        }
    }
}
