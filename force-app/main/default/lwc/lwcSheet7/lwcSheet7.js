import { LightningElement, track } from 'lwc';
    import LwcMethod from '@salesforce/apex/LwcSheet7.LwcMethod' 
    export default class LwcSheet7 extends LightningElement {
        @track Username;
        @track Password;
        @track num;
        number1handler(event)
        {
    this.Username=event.target.value;
        }
        number2handler(event)
        {
    this.Password=event.target.value;
        }

    addClick()
    {
        LwcMethod({UserName:this.Username, Password: this.Password})
        .then((result) =>{
            this.num=result;
            if(this.num===1){
                window.alert("Successful")
            }
            else if(this.num===0){
                window.alert("UnSuccessful")
            }
        });
        
            
    }
    }