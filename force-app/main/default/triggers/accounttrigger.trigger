trigger accounttrigger on Account (after insert) {
    ContactClass.createCon(trigger.new);
}