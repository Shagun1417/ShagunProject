import { LightningElement,track } from 'lwc';

export default class Test1 extends LightningElement {
    @track onClickButtonLabel ='show';
    myTitle = 'salesForece noob';
   // cardvisible properties have been introduce here intialize with false, 
   //false then data will show on the screen  
    @track cardVisible=false;

    handler(event){
        const label= event.target.label;

        if(label=== 'show'){
            this.onClickButtonLabel='hide';
            this.cardVisible=true;
        }
        else if(label==='hide'){
            this.onClickButtonLabel='show';
            this.cardVisible=false;
        }
    }
}