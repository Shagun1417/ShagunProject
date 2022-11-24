import { LightningElement } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

import Account_Object from '@salesforce/schema/Account';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Site from '@salesforce/schema/Account.Site';
import Account_Phone from '@salesforce/schema/Account.Phone';


export default class LwcSheet1 extends LightningElement {

    ObjectApiName = Account_Object;
    nameField = Account_Name;
    siteField = Account_Site;
    phoneField = Account_Phone;
    accountId = "account id displayed after save";

    handleSuccess(event){

        this.accountId = event.detail.id;

        const events = new ShowToastEvent({
            title:"Successful",
            message: "Account Created",
            variant: 'success'
        });
        this.dispatchEvent(events);
    }
}