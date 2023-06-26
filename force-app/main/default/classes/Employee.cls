public class Employee {
    public static void InsertEmp(List<Department__c> deplist){
        system.debug(deplist);
        List<Employee__c> emps = new list<Employee__c>();
        for(Department__c dep : deplist){
            for(Integer i=1;i<=5;i++){
                Employee__c emp = new Employee__c();
                emp.Name = 'emp'+i +dep.Name;
                emp.Employee_Department__c = dep.id;
                emp.Company__c = DEP.Company__c;
                emp.Gender__c = 'male';
                emps.add(emp);
                
            }
        }
        
        insert emps;
    }
    public static void deleteEmp(List<Department__c> deps)
    
    {
        Delete [Select id from Employee__c where Employee_Department__c IN  : deps];
       
    
    }
     public static void deleteDep(List<Employee__c> emps){
         Map<Id, List<Employee__c>> depEmpmap = new  Map<Id, List<Employee__c>>();
         list<Department__c> deps = new List<Department__c>();
         list<Employee__c> allemps = new List<Employee__c>();
         list<Id> depId = new List<Id>();
         for(Employee__c emp : emps){
             depId.add(emp.Employee_Department__c);
         }
        allemps.addall(emps);
        allemps.addall([select Id, Employee_Department__c from employee__c where Employee_Department__c IN : depId AND Id Not In :emps]);
         for(Employee__c emp : allemps){
             if(depEmpmap.containskey(emp.Employee_Department__c)){
                 //List<Employee__c> tempEmp = depEmpmap.get(emp.Employee_Department__c);
                 depEmpmap.get(emp.Employee_Department__c).add(emp);
                 //depEmpmap.put(emp.Employee_Department__c, depEmpmap.get(emp.Employee_Department__c).add(emp));
             }else{
                 List<Employee__c> tempEmp = new List<Employee__c>();
                 tempEmp.add(emp);
                 depEmpmap.put(emp.Employee_Department__c, tempEmp);
             }
         }
         for(Id tempDepId : depEmpmap.keyset()){
             if(depEmpmap.get(tempDepId).size() == 1){
                 deps.add(new Department__c(Id=tempDepId));
             }
         }
        delete deps;
    }
   
 
    
}