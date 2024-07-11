import { LightningElement, wire } from 'lwc';
import getAcctRecordList from '@salesforce/apex/ContactControllerWithLwc.getAccountRecords';

export default class WireApexAuraEnable extends LightningElement {

    @wire(getAcctRecordList) accounts;

}