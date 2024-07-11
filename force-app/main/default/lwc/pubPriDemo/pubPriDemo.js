import { LightningElement, api } from 'lwc';

export default class PubPriDemo extends LightningElement {
    message="Private Property";
    @api recordId;
}