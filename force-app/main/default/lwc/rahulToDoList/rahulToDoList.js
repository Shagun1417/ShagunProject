import { LightningElement, track, wire } from 'lwc';
import getTasks from '@salesforce/apex/RahulToDo.getTasks';
import { refreshApex } from '@salesforce/apex';

export default class RahulToDoList extends LightningElement {

 
    @track
    todoTasks = [];

    todoTasksResponse;
    newTask = '';
 
    updateNewTask(event) {
        this.newTask = event.target.value;
    }
    
    addTaskToList(event) {
      
        this.todoTasks.push({
            id: this.todoTasks.length + 1,
            name: this.newTask
        });
        this.newTask = '';
    }
   
    deleteTaskFromList(event) {
        let idToDelete = event.target.name;
        let todoTasks = this.todoTasks;
        let todoTaskIndex;
     
        for(let i=0; i<todoTasks.length; i++) {
            if(idToDelete === todoTasks[i].id) {
                todoTaskIndex = i;
            }
        }
        todoTasks.splice(todoTaskIndex, 1);
      
    }

  
    @wire(getTasks)
    getTodoTasks(response) {
        this.todoTasksResponse = response;
        let data = response.data;
        let error = response.error;
        if(data) {
            console.log('data');
            console.log(data);
            this.todoTasks = [];
            data.forEach(task => {
                this.todoTasks.push({
                    id: this.todoTasks.length + 1,
                    name: task.Subject,
                    recordId: task.Id
                });
            });
        } else if(error) {
            console.log('error');
            console.log(error);
       }
    }

    
    refreshTodoList() {
        refreshApex(this.todoTasksResponse);
    }
}
