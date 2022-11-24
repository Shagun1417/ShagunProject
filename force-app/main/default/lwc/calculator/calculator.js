import {LightningElement} from 'lwc';

export default class Calculator extends LightningElement {
    result=0;
    number1;
    number2;

    number1handler(event){
        this.number1=event.target.value;
 }

 number2handler(event){
    this.number2=event.target.value;
}

addClick(){
    this.result=parseInt(this.number1) + parseInt(this.number2);
}

subClick(){
    this.result=parseInt(this.number1) - parseInt(this.number2);
}

mulClick(){
    this.result=parseInt(this.number1) * parseInt(this.number2);
}

divClick(){
    this.result=parseInt(this.number1) / parseInt(this.number2);
}
}