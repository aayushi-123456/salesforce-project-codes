@isTest
public class todoTestClass {
    @testSetup
    static void createseedData(){
        todo__c todo = new todo__c(Name = 'test',ToDo_EndTime__c= Datetime.now().addDays(1),  ToDo_Description__c='Test Desc');
    }
    @isTest
    static void getUserNameTest(){
        Test.starttest();
        system.assertEquals(userinfo.getName(), todoClass.getUserName());
        Test.stoptest();
    }
    @isTest
    static void toDomethodTest(){
        Test.startTest();
        system.assert(ToDoClass.toDomethod() != null);
        Test.stopTest();
    }
    @isTest
    static void validateDate(){
        todo__c todo = new todo__c(Name = 'test2',ToDo_EndTime__c= Datetime.now().addDays(-1),  ToDo_Description__c='Test Desc');
        Test.startTest();
        try{
            insert todo;
        }catch(exception e){
            System.Assert(e.getMessage() != null);
        }
        Test.stopTest();
    }
}