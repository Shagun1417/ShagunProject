import { LightningElement } from 'lwc';
export default class DdnParent extends LightningElement {
num=0;

handleIncreament(){
    this.num++;

}

handleDecrement(){
    this.num--;
    // this.template.querySelector("c-ddn-child").handleMinus();
}
handleDDecrement(){
    // this.querySelector("c-ddn-child").handleDMinus();
    this.num=this.num-2;
}
}