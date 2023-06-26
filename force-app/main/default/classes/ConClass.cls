public class ConClass {
    public static void insertName(List<Account> accList){
        LIST<Contact> contList = new List<Contact>();
        for(Account acc : accList){
            Contact cont = new Contact();
            cont.LastName =   'ashu';
            contList.add(cont);
            
        }
    }
}