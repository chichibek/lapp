package lapp

class AvatarService {

    def isValid(file) {
    	List validContentType = ['image/jpeg','image/jpeg','image/png','image/gif']
            
        return (validContentType.contains(file.getContentType())) ? true : false
    }
}
