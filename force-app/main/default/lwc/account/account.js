import { api, LightningElement } from 'lwc';

export default class Account extends LightningElement {
   @api parentMesg = 'Parent Message IT is';

   connectedCallback() {
        console.log('Message from parent:', this.parentMesg);
    }
}