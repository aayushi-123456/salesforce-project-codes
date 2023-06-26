trigger OrgTrigger on Company__c (after insert) {
    if(trigger.isinsert && trigger.isafter){
        Organization.insertcompany(trigger.new);
    }
    

}