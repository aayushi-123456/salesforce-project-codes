trigger toDoTrigger on ToDo__c (before insert, before update) {
    if(trigger.isbefore){
        if(trigger.isinsert){
            ToDoClass.handleStartTime(trigger.new);
            ToDoClass.validateDate(trigger.new);
        }else If(trigger.isinsert || trigger.isupdate){
            ToDoClass.validateDate(trigger.new);
        }
    }
}