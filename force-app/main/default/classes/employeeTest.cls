@isTest
public class employeeTest{
    @isTest
    static void empmethod(){
        Department__c dep = new Department__c();
        dep.Name = 'depart1';
        dep.Company__c = 'test';
        insert dep;
    }
    @isTest
    static void emptrigger(){
        Employee__c emp = new Employee__c();
        emp.Name = ' emp1';
        insert emp;
    }
}