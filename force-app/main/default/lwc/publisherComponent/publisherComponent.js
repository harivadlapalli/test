import { MessageContext, publish } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import abhyramIT from '@salesforce/messageChannel/abhyramIT__c';

export default class PublisherComponent extends LightningElement {
    firstName;
    lastName;

        @wire(MessageContext) messageContext;
        
        handleInputChange(event) {
            const { name, value } = event.target;
            if (name === 'firstName') {
                this.firstName = value;
            } else if (name === 'lastName') {
                this.lastName = value;
            }
        }

        handleClick(event){
            //code to pass mesg to subscriber
            let payload ={firstname:this.firstName, lastname:this.lastName};
            publish(this.messageContext, abhyramIT, payload);
    }
}