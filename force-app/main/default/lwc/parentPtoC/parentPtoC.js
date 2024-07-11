import { LightningElement } from 'lwc';

export default class ParentPtoC extends LightningElement {
    parentUserName;
    submitClickHandler(){
        this.parentUserName = this.template.querySelector('lightning-input').value;
    } 
    
}