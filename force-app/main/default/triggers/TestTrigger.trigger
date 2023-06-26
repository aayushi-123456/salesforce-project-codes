trigger TestTrigger on Account  (after insert) {
    if(Trigger.isinsert && Trigger.isafter){
        ConClass.insertName(trigger.new);
        
    }
}