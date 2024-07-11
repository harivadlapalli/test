import { LightningElement } from 'lwc';

export default class GrandParent extends LightningElement {
    dataFromParentCmp;
    handleCustomEvent(e){
        this.dataFromParentCmp=e.detail;
    }
}