import { LightningElement, track, api} from 'lwc';
import  AccountName from '@salesforce/schema/Account.Name';
import  AccountRating from '@salesforce/schema/Account.Rating';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';


export default class DemoComp extends NavigationMixin(LightningElement) {

    objectaapiname = 'Account';
    recordPageUrl;
    recordId;
    accfield =[AccountName, AccountRating];
    HandleSuccess(event){
        // Toast Message
        const toastevent = new ShowToastEvent({
            title: 'Account Creation',
            message:'The Account Has Been Created'+event.detail.id,
            variant: "Success"
        });
        this.dispatchEvent(toastevent);
        //Navigation Mix IN
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId:event.detail.id,
                objectApiName: 'Account',
                actionName: 'view',
               //url:https:'//ithub-f-dev-ed.develop.lightning.force.com',
            }
        });
    }

}