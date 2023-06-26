trigger StdClass on Student__c (before update) {
    if(trigger.isbefore && trigger.isupdate){
        StudentClass.updateStd(trigger.newmap ,trigger.oldmap);
        
    }
    
    

}