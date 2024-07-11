import { LightningElement, track } from 'lwc';

export default class Demo extends LightningElement {

    @track Message;

    handleproperty(event){
        this.Message = event.target.value;
    }
}