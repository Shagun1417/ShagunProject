  import { LightningElement ,api } from 'lwc';
import getOpportunity from '@salesforce/apex/lwcSheet3.getOpportunity'
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LwcSheet3 extends LightningElement {

    @api recordId
    closeDate
   myTitle="dDn3lwc";
    // handleClick(){ 
    
   showToast(){
        const event=new ShowToastEvent({
         title: 'date updated',
            message: 'Successful',
            variant:'success'
        });
        this.dispatchEvent(event);
}
handle(event)
{
    this.closeDate = event.target.value
}
  
    handleclick()
    {
    getOpportunity({oppId: this.recordId, closeDateOpp: this.closeDate})
    .then(result=>{
        console.log("user list-->" + (result))
        
setTimeout(() => {
    eval("$A.get('e.force:refreshView').fire()")
}, 1000);
this.showToast()
    })
    .catch(error => {
        console.log("error is here" + JSON.stringify(error))
    })
   
} 

}