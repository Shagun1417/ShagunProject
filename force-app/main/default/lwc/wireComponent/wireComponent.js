import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/wireClass.getAccount'
 
const column=[
    {label:'employee name',fieldName:'Name'},
    {label:'employee id',fieldName:'Id'}
];
export default class WireComponent extends LightningElement {

    @track columns=column;
    @track data=[];

    @wire(getAccount)
    ddnAccount({data,error}){
        if(data){
            this.data=data;
        }
        else if(error){
            console.log('error accured');
        }
    }


}