import { LightningElement,api,track } from 'lwc';
import ToDo_OBJECT from '@salesforce/schema/ToDo__c';
import getUserName from '@salesforce/apex/ToDoClass.getUserName';
import toDomethod from '@salesforce/apex/ToDoClass.toDomethod';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {deleteRecord} from 'lightning/uiRecordApi';



const actions = [
    { label: 'edit', name: 'edit' },
    { label: 'delete', name: 'delete' }
 ];

const columns = [
    { label: 'ToDo Name', fieldName:'Name' },
    {
    label: 'ToDo StartTime', 
    fieldName: 'ToDo_StartTime__c',
    type: 'date', 
    typeAttributes: {
            day: "numeric",
            month: "numeric",
            year: "numeric",
            hour: '2-digit',
            minute: '2-digit',
            hour12: true,
            timeZone:'Asia/Kolkata'
    }
},
    //{ label: 'ToDo StartTime', fieldName: 'ToDo_StartTime__c' },
    {
    label: 'ToDo EndTime', 
    fieldName: 'ToDo_EndTime__c',
    type: 'date', 
    typeAttributes: {
        day: "numeric",
        month: "numeric",
        year: "numeric",
        hour: '2-digit',
        minute: '2-digit',
        hour12: true,
        timeZone:'Asia/Kolkata'
    }
},
    { label: 'Parent Todo', fieldName: 'Parent'},
    {label: 'ToDo Description',fieldName:'ToDo_Description__c'},
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },     
    
];
 

export default class Todo extends LightningElement {

    data = [];
    columns = columns;
    greetings;
    objectAPIName = ToDo_OBJECT;
    @track showModal = false;
    @api recordId;
    @track CurrentRecordToEdit = null;
    @api openEditpage = false;



    connectedCallback(){
        this.getCurrentUserName();
        this.getTodoList();
    }

    getTodoList(){
        toDomethod()
        .then((result) => {
            console.log(result);
            var tempdata =[];
            result.forEach(currentItem => {
                var temptodo = {};
                temptodo.Name = currentItem.Name;
                temptodo.ToDo_Description__c = currentItem.ToDo_Description__c;
                temptodo.ToDo_StartTime__c = currentItem.ToDo_StartTime__c;
                temptodo.ToDo_EndTime__c = currentItem.ToDo_EndTime__c;
                temptodo.Id = currentItem.Id;
                temptodo.OwnerId = currentItem.OwnerId;
                if(currentItem.ToDo__r){
                    temptodo.Parent = currentItem.ToDo__r.Name;
                }
                tempdata.push(temptodo);
            });
            this.data = tempdata;
            console.log(tempdata);
        }).catch((err) => {
            console.log(err);
        });

    }
    openModal(){
    // Setting boolean variable to true, this will show the Modal
        this.showModal = true;
    }
    closeModal() {
        // Setting boolean variable to false, this will hide the Modal
        this.showModal = false;
    }
    successHandler(){
        this.getTodoList();
        this.closeModal();
        
    }
    getCurrentUserName(){
        getUserName()
        .then((result) => {
            if(new Date().getHours()+"."+new Date().getMinutes() > 5.0 && new Date().getHours()+"."+new Date().getMinutes() < 12.0){
                this.greetings = "Good Morning "+ result;
            }
            else if(new Date().getHours()+"."+new Date().getMinutes() > 12.0 && new Date().getHours()+"."+new Date().getMinutes() < 17.0){
                this.greetings = "Good Afternoon "+ result;
            }
            else if(new Date().getHours()+"."+new Date().getMinutes() > 17.0 && new Date().getHours()+"."+new Date().getMinutes() < 22.0){
                this.greetings = "Good Evening "+ result;
            }
            else if(new Date().getHours()+"."+new Date().getMinutes() > 22.0 && new Date().getHours()+"."+new Date().getMinutes() < 5.0){
                this.greetings = "greetings "+ result;
            }
            
        }).catch((err) => {
            console.log(err);
        });
    } 
// to close the edit page
    handleCancel(){
        this.openEditpage = false;
    }
// after editing print the message of success and close the page.
    handleSuccess(){
        this.showInfoToast('Record changed','Record changed Successfully','success');
        this.getTodoList();
        this.handleCancel();
    }
// to print a message
    showInfoToast(title,message,variant) {
    const evt = new ShowToastEvent({
        title: title,
        message: message,
        variant: variant,
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}
// to delete  a record
    handleDelete(Id){
        deleteRecord(Id)
        .then(() => {
            this.showInfoToast('Record Deleted','Record Deleted Successfully','success');
            this.getTodoList();
        })
        .catch((err) => {
            this.showInfoToast('Error!!',error.body.message,'error');
            
        });
    }
// to edit and delete action
     handleRowActions(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'edit':
                this.openEditpage = true;
                this.CurrentRecordToEdit= row.Id;
                break;
            case 'delete':
                this.handleDelete(row.Id);
                break;
            default:
        }
    }
}