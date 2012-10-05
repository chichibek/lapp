package ni.com.lora

class Schedule {

	String fromDay
	String toDay
	String fromHour
	String toHour

    static constraints = {
    	fromDay inlist:['Sunday','Monday','Thusday','Wednesday','Thursday','Friday','Saturday']
    	toDay inlist:['Sunday','Monday','Thusday','Wednesday','Thursday','Friday','Saturday']
    	fromHour inList:['8:00am','8:30am','9:00am','9:30am','10:am','10:30am','11:00am','11:30am','12:00m','12:30pm','1:00pm','1:30pm','2:00pm','2:30pm','3:00pm','3:30pm','4:00pm','4:30pm','5:00pm','5:30pm','6:00pm']
        toHour inList:['8:00am','8:30am','9:00am','9:30am','10:am','10:30am','11:00am','11:30am','12:00m','12:30pm','1:00pm','1:30pm','2:00pm','2:30pm','3:00pm','3:30pm','4:00pm','4:30pm','5:00pm','5:30pm','6:00pm']
    }    

    static belongsTo = [company:Company]
}
