import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Account_Object from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
import Website_Field from '@salesforce/schema/Account.Website';
import { NavigationMixin } from 'lightning/navigation';

export default class CreateRecordLDSLRF extends NavigationMixin(LightningElement) {
    accountObject = Account_Object;
    myFields = [Name_Field, Website_Field];

    handleAcctCreated(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Record Created',
                message: 'Record created successfully with ID: ' + event.detail.id,
                variant: 'success'
            })
        );
        this[NavigationMixin.Navigate]({
            type: "standard__recordPage",
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Account',
                actionName: 'view',
            }
        });
    }

}
