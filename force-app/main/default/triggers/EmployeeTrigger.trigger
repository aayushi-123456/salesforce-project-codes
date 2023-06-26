trigger EmployeeTrigger on Employee__c (before insert,before update, after insert,before delete) {
    system.debug('ok');
    if(trigger.isinsert &&
       trigger.isbefore){
        EmployeeTriggerController.updatename(trigger.new);
    }
    else if(trigger.isbefore && trigger.isdelete)
    {
        Employee.deleteDep(trigger.old);
    }
    
}