import { LightningElement } from 'lwc';

export default class ParentCmp extends LightningElement {
    dataFromChildCmp;
    handleCustomEvent(e){
       this.dataFromChildCmp=e.detail;
    }

}