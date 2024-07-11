import { LightningElement } from 'lwc';

export default class LifecycleChildCompo extends LightningElement {

    constructor(){
        super();
        console.log("call from child cmponet constructor");
    }

    connectedCallback(){
        console.log("call from child component connected call back method");
    }

    renderedCallback(){
        console.log("call from child component rendered call back method");
    }

    disconnectedCallback(){
        console.log("call from child component disconnected call back method");
    }
}