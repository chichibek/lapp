package ni.com.lora

class Schedule {

	String fromDay
	String toDay
	String fromHour
	String toHour

    static constraints = {
    	fromDay inlist:['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    	toDay inlist:['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    	fromHour inList:['8:00am','9:00am','10:am','11:am','12:00','1:00pm','2:00pm','3:00pm','4:00pm','5:00pm','6:00pm']
    	toHour inList:['8:00am','9:00am','10:am','11:am','12:00','1:00pm','2:00pm','3:00pm','4:00pm','5:00pm','6:00pm']
    }

    static belongsTo = [company:Company]
}
