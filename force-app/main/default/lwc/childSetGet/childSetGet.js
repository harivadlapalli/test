import { LightningElement, api } from 'lwc';

export default class ChildSetGet extends LightningElement {

     upperCaseName;

    @api
    get upperCaseName(){
        return this.upperCaseName;
    }

    set upperCaseName(value){
        this.upperCaseName = value.toUpperCase();
        console.log(this.upperCaseName);
    }
}