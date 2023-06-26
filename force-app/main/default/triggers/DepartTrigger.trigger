trigger DepartTrigger on Department__c (after insert) {
    System.debug('trigger.isinsert'+trigger.isinsert);
    System.debug('trigger.isafter'+trigger.isafter);
    if(trigger.isinsert && trigger.isafter){
        Employee.InsertEmp(trigger.new);
       
    }

}