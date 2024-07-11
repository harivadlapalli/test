import { LightningElement, track } from 'lwc';

export default class ParentComponentCtoP extends LightningElement {
   @track firstName;
   @track lastName;

    handleSearchEvent(event) {
        this.firstName = event.detail.FirstName;
        this.lastName = event.detail.LastName;
    }
}
