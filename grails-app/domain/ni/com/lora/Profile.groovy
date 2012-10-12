package ni.com.lora

class Profile {

	String fullName
    String gender
    Date birthDay
    String city

    static constraints = {
    	fullName nullable:true
        gender nullable:true, inList:['male','female']
        birthDay nullable:true
        city nullable:true, inList:['Leon','Esteli','Matagalpa']
    }

    static belongsTo = User

    String toString() {
        fullName
    }

}
