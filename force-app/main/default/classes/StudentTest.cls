@isTest
public class StudentTest {
    @testsetup
    static void createtestdata(){
            Student__c std = new Student__c();
            std.Name = 'test';
            std.Last_Name__c = 'xyz';
            std.Father_Name__c = 'abc';
            insert std;  
    }
    @isTest
    static void updatetest(){
        Student__c std = [Select id,Name,Last_Name__c,Father_Name__c from Student__c limit 1 ];
        std.Name='monika';
        update std;
    }
}