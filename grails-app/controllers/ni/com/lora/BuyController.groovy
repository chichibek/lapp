package ni.com.lora

class BuyController {
    def dealService

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
    	def buyInstanceList = Buy.findAllByUser(session?.user,[sort:'dateCreated',order:'desc'])
    	[buyInstanceList:buyInstanceList]
    }

    def show() {
        def buyInstance = Buy.get(params.id)

        if(!buyInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list')
            return false
        }

        [buyInstance:buyInstance]
    }

    def setBuy() {
    	if(!session?.user) {
    		redirect(controller:'user', action:'login', params:[deal:params.deal, quantity:params.quantity])
            return false
    	}

        def dealInstance

        if(dealService.updateQuantity(params.deal,params.quantity)) {
            dealInstance = Deal.get(params.deal)

            def buyInstance = new Buy(
                user:session?.user,
                deal:dealInstance,
                quantity:params.quantity
            )

            flash.message = (buyInstance.save(flush:true)) ? message(code:'ni.com.lora.success') : message(code:'ni.com.lora.error')
        }else{
            flash.message = message(code:'ni.com.lora.somethingwherewrong')
        }

        redirect(controller:'deal', action:'notification', params:[deal:dealInstance,quantity:params.quantity])
    }

    def buysByDeal() {
        def buyInstanceList = Buy.findAllByDeal(Deal.get(params.id))

        if(!buyInstanceList) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(controller:'deal',action:'list',params:[id:params.company])
            return false            
        }

        [buyInstanceList:buyInstanceList, dealInstance: Deal.get(params.id)]
    }

    def changePaidState() {
        def buyInstance = Buy.get(params.id)

        if(!buyInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(controller:'deal',action:'list',params:[id:params.deal])
            return false
        }

        buyInstance.properties['paid'] = (buyInstance.paid) ? false : true

        if(!buyInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            render(view:'buysByDeal',model:[dealInstance:dealInstance], params:[id:params.deal])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'buysByDeal',params:[id:params.deal,company:params.company])
    }

    def listNewBuys() {
        [buyInstanceList: Buy.findAllByPaid(false,[sort:'dateCreated', order:'desc'])]
    }

    def totalItemsSaled() {
        //TODO:try to find a better way to get this
        def total = 0
        params.deal.buys.each {
            if(!total) {
                total = it.quantity
            }else{
                total += it.quantity
            }
        }

        render total
    }

    def countNewBuys() {
        //TODO:create query that check all buys with paid false that belongs to a company of the current client user
        def buyInstanceList
        def count = 0
        
        //if (session?.user?.role == 'admin') {
            buyInstanceList = Buy.findAllByPaid(false)
        //}else if(session?.user?.role == 'client') {
            def userInstance = User.findByUserName(session.user.userName)

            userInstance?.companies.each {
                def company = it.name
                /*
                if(it?.deals && it?.deals?.state) {
                    it.deals.each {
                        if(it?.buys && it?.buys?.paid) {
                            println it
                        }
                    }
                }
                */

                if(it.deals && it.deals.state) {
                    it?.deals?.each {
                        //println it
                    }    
                }
                
            }

        //}

        render buyInstanceList.size()
    }
}