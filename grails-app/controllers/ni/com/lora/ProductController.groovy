package ni.com.lora

class ProductController {
    def avatarService

    def index() {
    	redirect(action:'list',params:params)
    }
    
    def list() {
    	def productInstanceList = Product.findAllByCompany(Company.get(params.id))
    	[productInstanceList:productInstanceList, productInstanceTotal:productInstanceList.size()]
    }

    def create() {
    	[productInstance:new Product(params)]
    }

    def save() {
        def file = request.getFile('avatar')

        if(!avatarService.isValid(file)) {
            flash.message = message(code:'ni.com.lora.invalidcontenttype',args:[file.getContentType()])
            redirect(action:'create', id:params.company.id)
            return false
        }
                
    	def productInstance = new Product(params)

        if(!productInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            chain(action:'create', model:[productInstance:productInstance], id:params.company.id)
            return false
        }

        flash.message = message(code:"ni.com.lora.success")
        redirect(action:"create",params:[id:params.company.id])
    }

    def edit() {
    	def productInstance = Product.get(params.id)

    	if(!productInstance) {
    		flash.message = message(code:"ni.com.lora.notfound", args:[params.id])
    		redirect(action:"list",params:[id:params.company])
    		return false
    	}

    	[productInstance:productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)

        if(params.avatar.isEmpty()) {
            productInstance.properties['name','price'] = params
        }else{
            def file = request.getFile('avatar')

            if(avatarService.isValid(file)) {
                productInstance.properties = params
            }else{
                flash.message = message(code:'ni.com.lora.error')
                chain(action:'edit', model:[productInstance:productInstance], params:[id:params.id, company:params.company.id])
                return false
            }
        }

        if(!productInstance.save(flush:true)) {
            flash.message = message(code:'ni.com.lora.error')
            chain(action:'edit', model:[productInstance:productInstance], params:[id:params.id, company:params.company.id])
            return false
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:"show", params:[id:params.id,company:params.company.id])
    }

  
    def show() {
        def productInstance = Product.get(params.id)

    	if(!productInstance) {
    		flash.message = message(code:"ni.com.lora.notFound", args:[params.id])
    		redirect(action:"list",params:[id:params.company])
    		return false
    	}

    	[productInstance:productInstance]
    }

    def delete() {
        def  productInstance = Product.get(params.id)
        
        if(!productInstance) {
            flash.message = message(code:'ni.com.lora.notFound',args:[params.id])
        }else{
        	try {
	            productInstance.delete(flush:true)          
	        }catch(org.springframework.dao.DataIntegrityViolationException e) {
	            flash.message = message(code:'ni.com.lora.error')
	        }
        }

        flash.message = message(code:'ni.com.lora.success')
        redirect(action:'list',params:[id:params.company])
    }

    //public
    def renderProductAvatar() {
        def productInstance 

        if(!params.company && !params.product) {
            productInstance = Product.get(params.id)
        }else{
            productInstance = Product.findByCompanyAndName(Company.findByName(params.company),params.product)
        }
    	 
        response.setContentLength(productInstance.avatar.length)
		response.outputStream.write(productInstance.avatar)
    }

    def getMoneySaved() {
        def productInstance = Product.findByCompanyAndName(Company.findByName(params.company.toString()),params.product)

        render productInstance?.price - params.price
    }

    def getPercentageSaved() {
        def productInstance = Product.findByCompanyAndName(Company.findByName(params.company.toString()),params.product)
        def result = params.price * 100 / productInstance?.price

        render result.round() + '%'
    }

}
