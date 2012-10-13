package ni.com.lora

class DealController {
    def dealService
    def beforeInterceptor = [action: this.&isPublished, only:['delete','show']]

    private isPublished() {
        //def params.company = (params.company.id) ?: params.company
        def dealInstance = Deal.findByCompanyAndId(Company.get(params.company),params.id)

        if(dealInstance.published) {
            flash.message = message(code:'ni.com.lora.notpublished')
            redirect(action:'list',params:[id:params.company])
            return false
        }
    }

    def index() { 
    	redirect(action:'list',params:params)
    }

    def list() {
    	def companyInstance = Company.get(params.id)
    	def dealInstanceList = Deal.findAllByCompany(companyInstance,[sort:'dateCreated',order:'desc'])

    	[dealInstanceList:dealInstanceList,companyInstance:companyInstance]
    }

    def create() {
    	[dealInstance:new Deal(params),companyInstance:Company.get(params.id)]
    }

    def save() {
        //TODO:this should be in other location
    	params.fromDate = (params.fromDate) ? new Date().parse('yyyy-MM-dd',params.fromDate) : null
        params.toDate = (params.toDate) ? new Date().parse('yyyy-MM-dd',params.toDate) : null
        params.claimFrom = (params.claimFrom) ? new Date().parse('yyyy-MM-dd',params.claimFrom) : null
        params.claimUp = (params.claimUp) ? new Date().parse('yyyy-MM-dd',params.claimUp) : null
        //i mean this

        //check if dates are valid dates
        /*
        if(!dealService.areValidDates(params.fromDate, params.toDate, params.claimFrom, params.claimUp)) {
            flash.message = (message(code:'ni.com.lora.notvaliddates'))
            redirect(action:'create',params:[id:params.company.id])
            return false
        }
        */

    	def dealInstance = new Deal(params)

        //add subsidiaries for this deal
        params.each {key,value ->
            if(value == 'on') {
                def subsidiaryInstance = new Subsidiary(name:key)

                dealInstance.addToSubsidiaries(subsidiaryInstance)
            }
        }

    	if(!dealInstance.save(flush:true)) {
    		flash.message = message(code:'ni.com.lora.error')
    		render(view:'create',model:[dealInstance:dealInstance],params:[id:params.company.id])
    		return  false
    	}

    	flash.message = message(code:'ni.com.lora.success')
    	redirect(action:'list',params:[id:params.company.id])
    }

    def show() {
        def dealInstance = Deal.findByCompanyAndId(Company.get(params.company),params.id)

        if(!dealInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list',params:[id:params.company])
            return false
        }

        [dealInstance:dealInstance,companyInstance:Company.get(params.company)]
    }

    def update() {
        def dealInstance = Deal.findByCompanyAndId(Company.get(params.company.id),params.id)

        if(!dealInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list',params:[id:params.company.id])
            return false
        }

        //TODO:dry situation in save action
        params.fromDate = (params.fromDate) ? new Date().parse('yyyy-MM-dd',params.fromDate) : null
        params.toDate = (params.toDate) ? new Date().parse('yyyy-MM-dd',params.toDate) : null
        params.claimFrom = (params.claimFrom) ? new Date().parse('yyyy-MM-dd',params.claimFrom) : null
        params.claimUp = (params.claimUp) ? new Date().parse('yyyy-MM-dd',params.claimUp) : null

        dealInstance.properties = params
        
        //1. delete all subsidiares that belongs to thi deal
        def subsidiaryInstanceList = Subsidiary.findAllByDeal(dealInstance)
        for(subsidiary in subsidiaryInstanceList) {
            subsidiary.delete(flush:true)
        }

        //2. add new subsidiaries
        params.each {key,value ->
            if(value == 'on') {
                def subsidiaryInstance = new Subsidiary(name:key)
                dealInstance.addToSubsidiaries(subsidiaryInstance)
            }
        }
        
        if(!dealInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            render(view:'show',model:[dealInstance:dealInstance],params:[id:params.id,company:params.company.id])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'show',params:[id:params.id,company:params.company.id])
    }

    def delete() {
        def dealInstance = Deal.findByCompanyAndId(Company.get(params.company),params.id)

        if(!dealInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
        }else{
            try {
                dealInstance.delete(flush:true)
            }catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code:'ni.com.lora.error')
            }
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'list',params:[id:params.company])
    }

    def changePublishedState() {
        def dealInstance = Deal.findByCompanyAndId(Company.get(params.company),params.id)

        if(!dealInstance) {
            flash.message = (message(code:'ni.com.lora.notfound'))
            redirect(action:'list',params:[id:params.company])
            return false
        }

        if(dealInstance.buys.size()) {
            flash.message = message(code:'ni.com.lora.notallowed',args:[dealInstance.buys.size()])
        }else{
            dealInstance.properties['published'] = (dealInstance.published) ? false : true

            if(!dealInstance.save(flush:true)) {
                flash.message = (message(code:'ni.com.lora.error'))
                redirect(action:'list',params:[id:params.company])
                return false
            }

            flash.message = message(code:'ni.com.lora.success')
        }
        
        redirect(action:'list',params:[id:params.company])
    }

    def close() {
        redirect(action:'list',params:[id:params.company])
    }

    def detail() {
        def dealInstance = dealService.show(params.id,params.company)

        if(!dealInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'list',params:[id:params.company])
            return false
        }

        [dealInstance:dealInstance,companyInstance:Company.get(params.company)]   
    }

    def countClosedDeals() {
        def today = new Date()
        def yesterday = today - 1
        def dealInstanceList = Deal.findAllByState(false)
        def role = session?.user?.role

        if(role == 'client') {
            def userInstance = User.findByUserName(session?.user?.userName)
            def companies = userInstance.companies.asList()

            def query = Deal.where {
               (state == false) && (company.name in ['ubuntu','sublime2text'])
            }
            Deal result = query.find()

            render result
            return false
        }

        render dealInstanceList.size()
    }

    def listClosedDeals() {
        [dealInstanceList:Deal.findAllByState(false)]
    }

    //TODO:both render actions must go in it controller, here should be a service call
    def renderProductAvatar() {
        def allProduct = Product.get(params.id)
        response.setContentLength(allProduct.avatar.length)
        response.outputStream.write(allProduct.avatar)
    }

    def renderLogo(){
        def allProduct = Product.findByName(params.productName)
        render template:"show-product", model:[allProduct:allProduct]
    }

    //public
    def all() {
        def query = Deal.createCriteria()
        def today = new Date()

        def result = query {
            eq('published',true)
            and{
                eq('state',true)
            }
            and {
                le('fromDate',today)
                //ge('toDate',today)
            }
            order('dateCreated','desc')
        }

        [dealInstanceList:result]
    }

    def featured() {
        def dealInstance = Deal.get(params.id)

        if(!dealInstance) {
            flash.message = message(code:'ni.com.lora.notfound')
            redirect(action:'all')
            return false
        }

        [dealInstance:dealInstance]
    }

    def notification() { }

}