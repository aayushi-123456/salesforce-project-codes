public class ToDoClass {
    @AuraEnabled
    public static String getUserName(){
        return userInfo.getName();
        

    }

    @AuraEnabled
    public static List<ToDo__c> toDomethod(){
        return [select Id, OwnerId, Name,ToDo_StartTime__c, ToDo_EndTime__c, ToDo_Description__c,ToDo__r.Name from ToDo__c where OwnerId = :UserInfo.getUserId() ORDER BY LastModifiedDate DESC];
    }
    
    public static void handleStartTime(List<todo__c> todoList){
        for( todo__c todo : todoList){
            todo.ToDo_StartTime__c = system.now();
        }
    }
    
    public static void validateDate(List<todo__c> todoList ){
        for(todo__c todo : todoList){
            if(todo.ToDo_StartTime__c > todo.ToDo_EndTime__c){
                todo.addError('EndDate should be after currentDateTime');
            }
        }
    }
    public static void reassignRecords(List<SObject> objList, String userId){
       try{ 
        for(SObject obj : objList){
            obj.put('OwnerId', userId);
        }
        update objList;
       }
    catch(Exception err){
        throw new AuraHandledException(err.getMessage());
    }
 }

}