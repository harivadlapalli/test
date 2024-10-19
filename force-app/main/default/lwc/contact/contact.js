import { api, LightningElement } from 'lwc';

export default class Contact extends LightningElement {
    message;

    connectedCallback() {
        console.log('Message from parent to child:', this.message);
    }
    
}