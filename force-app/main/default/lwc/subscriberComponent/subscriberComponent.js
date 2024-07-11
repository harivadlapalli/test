 import { MessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import abhyramIT from '@salesforce/messageChannel/abhyramIT__c';

export default class SubscriberComponent extends LightningElement {
    firstname;
    lastname;
    subscription=null;

    @wire(MessageContext) messageContext;

    connectedCallback(){
        this.handleSubscrib();
    }

    disconnectedCallback(){
        this.handleUnsubscrib();    
    }

    handleSubscrib(){
        if(!this.subscription){
            this.subscription=subscribe(this.messageContext,abhyramIT,
            (parameter)=>{
                this.firstname = parameter.firstname;
                this.lastname = parameter.lastname;
            });
        }
    }

    handleUnsubscrib(){
        unsubscribe(this.subscription);
        this.subscription = null;
    }
}