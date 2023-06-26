@istest
public class TestVerifyDate {
    static testmethod void testclass(){
        date d = VerifyDate.CheckDates(system.today(),system.today()+1);
        date d1 = VerifyDate.CheckDates(system.today(),system.today()+60);
    }
    

}