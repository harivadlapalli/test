import { LightningElement } from 'lwc';

export default class LifecycleHooks extends LightningElement {

    isVisibile = true;

    constructor(){

        super();
        console.log("Construcotr called successfully");
    }

    connectedCallback(){
        console.log("call received from connected call back");

    }

    renderedCallback(){
        console.log("call received from rendered call back");
    }

    errorCallback(){
        console.log("error callback method called");
    }

    handleClick(){
            if(this.isVisibile == true){
                this.isVisibile = false;
            }else{
                this.isVisibile = true;
            }
    }
}