import { LightningElement,api,track} from 'lwc';
import abcmethod from '@salesforce/apex/abcController.abcmethod';
import CONTACT_OBJECT from '@salesforce/schema/Contact';



const columns = [
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'Email' },
    {label: 'last_Name__c',fieldName:'last_Name__c',type:'Text(10)'},
    
];

export default class accountLWC_class extends LightningElement {
    data = [];
    columns = columns;
    @api headerLabel = 'Contact List ';
    @api recordId ;



    connectedCallback(){
        abcmethod({AccountId: this.recordId})
        .then((result) => {
            this.data = result;
            
        }).catch((err) => {
            
        });
    }

    @track showModal = false;


    openModal(){
    // Setting boolean variable to true, this will show the Modal
        this.showModal = true;
    }

    closeModal() {
        // Setting boolean variable to false, this will hide the Modal
        this.showModal = false;
    }


    objectAPIName = CONTACT_OBJECT;
    
}