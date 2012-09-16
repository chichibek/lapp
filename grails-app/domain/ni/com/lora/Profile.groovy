package ni.com.lora

class Profile {

	byte[] avatar
	String fullName
    String gender
    //String numero de cedula
    Date birthDay
    String city

    static constraints = {
    	avatar nullable:true, maxSize:250000
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
