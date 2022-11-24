import { LightningElement } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

import Contact_Object from '@salesforce/schema/Contact';
import Contact_firstName from '@salesforce/schema/Contact.FirstName';
import Contact_Name from '@salesforce/schema/Contact.Name';

export default class AddContact extends LightningElement {
   ObjectApiName = Contact_Object;
     NameField = Contact_Name;
    // ameField = Contact_lastName;
    // contactId = "account id displayed after save";
handleClick(){
    Contacts=[
   { Name: this.NameField,},
];
}
    handleSuccess(event){

        this.contactId = event.detail.id;

        const events = new ShowToastEvent({
            title:"Successful",
            message: "Contact Created",
            variant: 'success'
        });
        this.dispatchEvent(events);
    }

}