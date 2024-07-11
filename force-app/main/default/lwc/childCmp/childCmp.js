import { LightningElement ,api} from 'lwc';

export default class ChildCmp extends LightningElement {
    @api sendToParent;
    messageFromChild;

    fromChild;
    handleChange(e){
         this.messageFromChild=e.target.value;
    }
    handleClick(e) {
        const customEvent = new CustomEvent('customclick', {
            detail : this.messageFromChild,
            bubbles : true,
            composed: true
        });
        this.dispatchEvent(customEvent);
    }
}