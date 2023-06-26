public class OlderAccountsUtility {
    public static Map<Integer,String> returnmap(String value1,String value2){
        //Map<Integer,String> M1 = new Map<Integer,String>{1=>value1,2=>value2};
        //M1.put(1,value1);
        //M1.put(2,value2);
        return new Map<Integer,String>{1=>value1,2=>value2};
            
    } 
    
    
    
    public static List<String> returnlist(String value1,String value2){
        //List<String> l1 = new list<String>{value1,value2};
        //l1.add(value1);
        //l1.add(value2);
        return new list<String>{value1,value2};
        
    }
    
    /*public static String returnString(List<String> l1){
        String s1 = '';
        for(String str:l1){
            s1=s1+str;
        }
        return s1;
    }*/
    
    public static Set<String> returnset(String value1,String value2){
        //Set<String> s1 = new set<String>{value1,value2};
            return new set<String>{value1,value2};
       
    }
    public static void Company(String orgname){
        Company__c abc = new Company__c(Name = orgname,Company_contact__c = '12345');
       // abc.Name = orgname;
        // abc.Company_contact__c = '12345';
        insert abc;
        
        List<Department__c > deplist = new List<Department__c >();
        for(integer i = 1;i<=5;i++){
            //Department__c  dep = new Department__c (Name = 'dep-'+i,Company__c = abc.id);
            //dep.Name = 'dep-'+i;
            //dep.Company__c = abc.id;
            deplist.add(new Department__c (Name = 'dep-'+i,Company__c = abc.id));   
        }
        insert deplist;
        List<Employee__c > emplist = new List<Employee__c >();
        
        for(Department__c tempdep : deplist){
            for(integer i=1;i<=5;i++){
                //Employee__c emp = new Employee__c(Name = 'emp'+i + tempdep.Name,Employee_Department__c = tempdep.id,Company__c = abc.id);
                //emp.Name = 'emp'+i + tempdep.Name;
                //emp.Employee_Department__c = tempdep.id;
                //emp.Company__c = abc.id;
                emplist.add(new Employee__c(Name = 'emp'+i + tempdep.Name,Employee_Department__c = tempdep.id,Company__c = abc.id));
            } 
        }
        insert emplist;
    }
    
    
}