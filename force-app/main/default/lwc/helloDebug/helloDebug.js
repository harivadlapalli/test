import { LightningElement, track } from 'lwc';

export default class HelloDebug extends LightningElement {

    @track greeting;
    
    connectedCallback(){
        this.greeting = 'World';
        console.log(':::::::',this.greeting);
    }
}