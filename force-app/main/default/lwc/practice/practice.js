import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Practice extends LightningElement {
  
   
        handler(){
        this.showToast();
        }


    showToast(){
        const event= new ShowToastEvent({
            title :' show toast',
            variant:'Success',
            message:'open tost',
        });
        this.dispatchEvent(event);
    }
}