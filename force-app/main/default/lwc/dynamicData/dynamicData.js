
import { LightningElement, track, wire } from 'lwc';
import myMethod from '@salesforce/apex/DynamicDataController.myMethod';
export default class DynamicData extends LightningElement {
    @track
    todoTasks=[];
    NewTask='';
    handleTask(event)
    {
       this.NewTask=event.target.value;
    }
     handleClickAdd(event)
    {
        this.todoTasks.data.push({
            id: this.todoTasks.length + 1,
            name:this.NewTask
        });
        NewTask=''; 
    }
    
    handleClickDelete(event)
    {
        let idToDelete = event.target.name;
        let todoTasks = this.todoTasks;
        let getIndex;
        for(let i=0; i<todoTasks.length; i++)
        {
            if(idToDelete=== todoTasks[i].Id){
                getIndex=i;
                console.log('id to delete'+ idToDelete);
            }
        }
        todoTasks.splice(getIndex,1);
    }

    @wire(myMethod)
    getdata({data,error}){
      //  let data= response.data;
     // let error= response.error;  
    if(data)
    {
        this.todoTasks=[];
        console.log(data);
        console.log(Subject);
        data.forEach(task => {
            this.todoTasks.push({
             id: this.todoTasks.length + 1,
            name: task.Subject,
        //    console.log(Subject);
                recordId: task.Id
           });
       });
    }
    else if (error)  {
        console.log('error');
    }
    }
}
