import { LightningElement, track, wire } from 'lwc';
import fetchOpportunity from '@salesforce/apex/OppStage.fetchOpportunity';
import getStage from '@salesforce/apex/OppStage.getStage';
import StageList from '@salesforce/apex/OppStage.StageList';

export default class OppStage extends LightningElement {

   // @track columns=column;
   
    @track data=[];

    @wire(fetchOpportunity)
    fetchOpp({data,error}){
        if(data){
            this.data=data;
        }
        else if(error){
            console.log('error accured');
        }
    }
values='';
get options(){
    return[
    {label: 'All', values:'StageName'},
    {label: 'web', values:'Closed Won'},
    {label: 'closed won', values:'Closed Won'},
    {label: 'closed lost', values:'Closed Won'},


];
}
handlerChanged(event)
{
this.values=event.detail.value;
this.value = this.values.join(', ');
}
}