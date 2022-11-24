import { LightningElement,track,api } from 'lwc';

export default class DdnChild extends LightningElement {
    @track showHide='show';
    @track cardVissible;
    @track colorChange='Success';
   
    handlerShow(event){
        const label= event.target.label;
        if(label==='show')
        {
            this.cardVissible=true;
            this.showHide='hide';
            this.colorChange='Destructive';
        }
        else if(label==='hide'){
            this.cardVissible=false;
            this.showHide='show';
            this.colorChange='Success';
        }
            }
    handlePlus(){
        this.dispatchEvent(new CustomEvent("add"));
    }
    handleMinus(){
         this.dispatchEvent(new CustomEvent("subtract"));
    }
    handleDMinus(){
        this.dispatchEvent(new CustomEvent("multiply"));
    }
  
}