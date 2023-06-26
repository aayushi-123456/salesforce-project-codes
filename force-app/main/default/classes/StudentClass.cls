public class StudentClass {
    public static void updateStd(map<id,Student__c >newitems,map<id,Student__c> olditems){
        for(id stdid : newitems.keyset()){
            if(olditems.get(stdid).Name != newitems.get(stdid).Name || olditems.get(stdid).Last_Name__c != newitems.get(stdid).Last_Name__c || olditems.get(stdid).Father_Name__c != newitems.get(stdid).Father_Name__c ){
                
               newitems.get(stdid).Full_Name__c = newitems.get(stdid).Name + newitems.get(stdid).Father_Name__c +newitems.get(stdid).Last_Name__c;
                            }
        }
    }

}