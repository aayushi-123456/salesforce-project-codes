public class ContactClass {
    public static void createCon(list<Account> acclist){
        list<Contact> conlist = new list<Contact>();
        for(Account a :acclist){
            for(String conName : a.contact_Name__c.split(',')){
               Contact cont = new Contact();
                cont.LastName = conName;
                cont.accountId = a.Id;
                conlist.add(cont);
            }
            
            
        }
        insert conlist;
    }

}