import { LightningElement } from 'lwc';

export default class FirstLwcComp extends LightningElement {
   variableForJs;
   handleChange(event){
    this.variableForJs = event.target.value;
    console.log('on click method '+this.variableForJs);
   }
   
}