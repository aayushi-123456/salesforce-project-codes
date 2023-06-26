public class abcController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> abcmethod(ID accountId){
        return[Select Id,Name,Phone,Email from Contact where AccountId =:accountId];
    }
}