public class EmployeeTriggerController {
    public static void updatename(List<Employee__c> emps){
        for(Employee__c emp : emps){
            if(emp.Gender__c == 'male'){
                emp.Name = 'mr.'+emp.Name;
            }
            else{
                emp.Name = 'miss.'+emp.Name;
            }
        }
        
    }

}