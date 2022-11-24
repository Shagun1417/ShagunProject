import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class DDN4 extends LightningElement {
   myTitle="dDn3lwc";
    handleClick(){
        this.showToast();
    }
    
    showToast(){
        const event=new ShowToastEvent({
         title: 'functionArgument',
            message: 'want to display toast',
            variant:'error'
        });
        this.dispatchEvent(event);

  
    }
}