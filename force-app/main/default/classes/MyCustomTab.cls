public class MyCustomTab {
    @AuraEnabled(cacheable=true)
    public static List<Contact> customMethod(String searchValue){
        return[Select Id,Name,last_Name__c,Phone,Email from Contact where Name like 'a%'];
    }
}