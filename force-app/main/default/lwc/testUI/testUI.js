import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import LASTNAME_FIELD from '@salesforce/schema/Contact.lastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormExample extends LightningElement {
    // Expose a field to make it available in the template
    fields = [NAME_FIELD,LASTNAME_FIELD,EMAIL_FIELD,PHONE_FIELD];

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Contact created',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }

    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api Contact;
}