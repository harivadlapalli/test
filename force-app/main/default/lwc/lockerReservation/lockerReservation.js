import { LightningElement } from 'lwc';
import reserveLocker from '@salesforce/apex/LockerReservationController.reserveLocker';

export default class LockerReservation extends LightningElement {
    lockerNumber;
    userName;
    reservationMessage;
    errorMessage;

    handleLockerNumberChange(event) {
        this.lockerNumber = event.target.value;
    }

    handleUserNameChange(event) {
        this.userName = event.target.value;
    }

    reserveLocker() {
        console.log('Locker number:', this.lockerNumber);
        console.log('User name:', this.userName);
        reserveLocker({ lockerNumber: this.lockerNumber, userName: this.userName })
            .then(result => {
                // Set the success message to display in the UI
                this.reservationMessage = result;
                this.errorMessage = null;
                console.log('Reservation success:', result);
            })
            .catch(error => {
                // Set the error message to display in the UI
                this.errorMessage = error.body.message;
                this.reservationMessage = null;
                console.error('Reservation error:', error);
            });
    }
}
