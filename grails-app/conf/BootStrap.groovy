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
                    password:'admin',
                    role:'admin',
                    enabled:true,
                    profile:adminProfile
                )

                admin.save(flush:true)

                def mark = new ni.com.lora.User(
                    userName:'mark',
                    email:'rhadned@yahoo.com',
                    password:'mark',
                    role:'client',
                    enabled:'true',
                    profile:markProfile
                )

                //COMPANY
                def ubuntu = new ni.com.lora.Company(
                    name:'ubuntu',
                    manager:'andres nieto',
                    address:'leon Nicaragua',
                    telephone:'23114455',
                    email:'rhadned@hotmail.com'
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
                    name:'imperial',
                    price:150
                )

                def hamburgesa = new ni.com.lora.Product(
                    name:'taparteria',
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

                ubuntu.addToBranches(ubuntuNicaragua)

                //COMPANY
                def sublime2text = new ni.com.lora.Company(
                    name:'sublime2text',
                    manager:'bbc mundo',
                    address:'leon mina el limon Nicaragua',
                    telephone:'2354477',
                    email:'rhadned@gator.com'
                )

                mark.addToCompanies(ubuntu)
                mark.addToCompanies(sublime2text)

                mark.save(flush:true)

                //DEAL
                
                break
        }
    }
    def destroy = {
    }
}
