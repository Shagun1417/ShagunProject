import { LightningElement, track} from 'lwc';
import fetchAccount from '@salesforce/apex/AccountRelatedObj.fetchAccount';
import getContacts from '@salesforce/apex/AccountRelatedObj.getContacts';
import fetchOpportunity from '@salesforce/apex/AccountRelatedObj.fetchOpportunity';


 

export default class AccountRelatedObj extends LightningElement {
   
@track acc=[];
@track con=[];
@track opp=[];
@track currentAccountId;

connectedCallback(){
fetchAccount()
.then(result => {
    if(result){
this.acc = result;
console.log('account list-->',this.acc);
}
})
}

onAcNameClickHandler(event){
//console.log(event.target.value)
this.currentAccountId = event.target.value;
this.getContactList()
this.getOpportunityList()
}

getContactList(){
    getContacts({accountId: this.currentAccountId})
    .then(result => {
        if(result){
    this.con = result;
    console.log('con List-->'+this.con);
    }
    })
}

getOpportunityList(){
   fetchOpportunity({accountId: this.currentAccountId})
    .then(result => {
        if(result){
    this.opp = result;
    console.log('opp List-->'+this.opp);
    }
    })
}
}