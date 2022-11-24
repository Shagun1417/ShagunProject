import { LightningElement, api, wire, track } from 'lwc';
//import Account_Name from '@salesforce/schema/Account.Name';
import myMethod from '@salesforce/apex/stripeAction.myMethod';

//import { getRecord } from 'lightning/uiRecordApi';

//import Customer_Id from '@salesforce/schema/Account.Consumer_Id__c';



//const fields = [ Customer_Id];

export default class StripesAction extends LightningElement {
@api recordId;
    
    //@track customerField= Customer_Id;
    //nameField = Account_Name;
//     @api customerId='1216162';
//    @api customerName= 'ssfhsdf';
   
 @track customerId;
@track  customerName;

    @wire(myMethod,{ids:'$recordId'})
    getStripeData({data,error}){
    if(data){
      //  this.customerId= getFieldValue(data, Customer_Id);
      this.customerId=data[0];
      this.customerName=data[1];
    }
    else {
        console.log('Error');
    }
    }

    connectedCallback(){
        console.log(' inside in connecet call back function ');
        console.log(this.recordId);
    }
}