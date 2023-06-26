import { LightningElement,api,track } from 'lwc';
import customMethod from '@salesforce/apex/MyCustomTab.customMethod';


const columns = [
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'Email' },
    {label: 'last_Name__c',fieldName:'last_Name__c',type:'Text(10)'},
    
];



export default class Customtab extends LightningElement {
     data = [];
    columns = columns;
    @api recordId;


 searchKey;
    @track Contact;
    //This Funcation will get the value from Text Input.
    handelSearchKey(event){
        this.searchKey = event.target.value;
    }

    
     
     myFunction(){
        customMethod({searchValue: this.recordId })
        .then((result) => {
            this.data = result;
            
        }).catch((err) => {
            
        });
    }
}