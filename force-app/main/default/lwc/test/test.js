import { LightningElement, track, wire } from 'lwc';
import testFun from '@salesforce/apex/test.testFun'
const columns = [
    {label: 'Name', fieldName:"Name"},
    {label: "Id", fieldName:'Id'}, 
    ];
export default class Test extends LightningElement {
    // name;
    // handle()
    // {  
    //     this.name="Shagun";

    // }
    @track columns=columns;
@track data=[];

myFunction(a,b){
    return a+b;
}
/*@wire(testFun)
wiredPlayer({data, error})
{
    if(data){
this.data=data;
}
    else if(error){
        console.log("error occured");
    }
}*/
//imperitve 
connectedCallback(){
   
    testFun()
    .then(result =>{
        this.data=result;
       
        
    })
    .catch(error =>{
        console.log("error  Occured");
    })
}
}