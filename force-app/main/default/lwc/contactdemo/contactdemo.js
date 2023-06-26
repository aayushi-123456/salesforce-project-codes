import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
export default class Contactdemo extends LightningElement {
    objectAPIName = CONTACT_OBJECT;
    connectedCallback(){
        //alert("okokokokok");
    }
    
}