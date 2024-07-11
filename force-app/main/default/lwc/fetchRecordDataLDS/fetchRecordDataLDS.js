// FetchRecordDataLDS.js
import { LightningElement, api } from 'lwc';

export default class FetchRecordDataLDS extends LightningElement {
    @api recordId;
    @api objectApiName;
    fields = ['AccountId', 'Name', 'Phone', 'Email', 'Title'];
}
