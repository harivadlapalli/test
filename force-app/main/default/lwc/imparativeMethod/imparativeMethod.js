import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ImperativeMethodForContacts.getContactInfo';

export default class ImparativeMethod extends LightningElement {
       contacts;
       error;
       
       handleLoad(){
        getContactList().then(result=>{this.contacts=result;})
        .catch(error=>{this.error=result});
       }
}