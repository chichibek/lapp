import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
    	switch(GrailsUtil.environment) {
            case 'development':
                //PROFILE

                def adminProfile = new ni.com.lora.Profile(
                    fullName:'Mario Martinez'
                )
                adminProfile.save(flush:true)
                def markProfile = new ni.com.lora.Profile(
                    fullName:'Mark sutherwors'
                )
                markProfile.save(flush:true)

                //USER
                def admin = new ni.com.lora.User(
                    userName:'admin',
                    email:'amakenadog@gmail.com',
                    address:'macondo',
                    identityCard:'123',
                    password:'admin',
                    role:'admin',
                    enabled:true,
                    profile:adminProfile
                )

                if(admin.hasErrors()) {
                    println admin.error
                } 

                admin.save(flush:true)
                //USER USER
                def user1 = new ni.com.lora.User(
                    userName:'user1',
                    email:'blog@gmail.com',
                    address:'macondo costa rica',
                    identityCard:'456',
                    password:'user1',
                    role:'user',
                    enabled:true
                )

                if(user1.hasErrors()) {
                    println user1.error
                } 

                user1.save(flush:true)

                def user2 = new ni.com.lora.User(
                    userName:'user2',
                    email:'blogvecind@gmail.com',
                    address:'macondo hondura',
                    identityCard:'789',
                    password:'user2',
                    role:'user',
                    enabled:true
                )

                if(user2.hasErrors()) {
                    println user2.error
                } 

                user2.save(flush:true)

                def mark = new ni.com.lora.User(
                    userName:'mark',
                    email:'rhadned@yahoo.com',
                    password:'mark',
                    address:'macondo niacargua',
                    identityCard:'101112',
                    role:'client',
                    enabled:'true',
                    profile:markProfile
                )

                def benbenuto = new ni.com.lora.User(
                    userName:'benbenuto',
                    email:'rhadned147@yahoo.com',
                    password:'benbenuto',
                    address:'mina el limon 1/2 cuadra hacia Macondo',
                    identityCard:'101112887785',
                    role:'client',
                    enabled:'true'
                )

                //COMPANY
                def ubuntu = new ni.com.lora.Company(
                    name:'ubuntu',
                    manager:'andres nieto',
                    address:'leon Nicaragua',
                    telephone:'23114455',
                    email:'rhadned@hotmail.com',
                    companyService:'shoes'
                )

                //SCHEDULE
                def ubuntuSchedule = new ni.com.lora.Schedule(
                    fromDay:'Monday',
                    toDay:'Saturday',
                    fromHour:'8:00am',
                    toHour:'6:00pm'
                )

                //PRODUCTS
                def pizza = new ni.com.lora.Product(
                    name:'pizza',
                    price:150
                )

                def hamburgesa = new ni.com.lora.Product(
                    name:'hamburgesa',
                    price:155.5
                )

                ubuntu.addToProducts(pizza)
                ubuntu.addToProducts(hamburgesa)
                ubuntu.addToSchedules(ubuntuSchedule)

                //BRANCH
                def ubuntuNicaragua = new ni.com.lora.Branch(
                    name:'ubuntu Nicaragua',
                    manager:'alonzo morning',
                    address:'frente a la salle',
                    telephone:'2338844',
                    email:'blog@yahoo.com'
                )

                def ubuntuLeon = new ni.com.lora.Branch(
                    name:'ubuntu Leon',
                    manager:'alonzo morning pascual',
                    address:'leon santiago de los caballeros',
                    telephone:'12278594',
                    email:'blogvecindad@yahoo.com'
                )

                ubuntu.addToBranches(ubuntuLeon)
                ubuntu.addToBranches(ubuntuNicaragua)

                //COMPANY
                def sublime2text = new ni.com.lora.Company(
                    name:'sublime2text',
                    manager:'bbc mundo',
                    address:'leon mina el limon Nicaragua',
                    telephone:'2354477',
                    email:'rhadned@gator.com',
                    companyService:'shoes'
                )

                mark.addToCompanies(ubuntu)
                mark.addToCompanies(sublime2text)

                if(mark.hasErrors()) {
                    println mark.error
                } 

                mark.save(flush:true)
                benbenuto.save(flush:true)

                //DEAL
                
                break
        }
    }
    def destroy = {
    }
}
