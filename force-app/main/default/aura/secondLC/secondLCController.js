({
    handleClick1 : function(component, event, helper) {
        //component.set("v.Message1","First Button Clicked")
        var msg= event.getSource().get("v.label");
        if(msg == "First Button"){
            component.set("v.Message1",msg);  
        }else{	
            component.set("v.Message2",msg); 
        }
        
    },
    
    handleClick2 : function(component, event, helper) {
        /*component.set("v.Message2","Second Button Clicked")
        var msg=event.getSource().get("v.label");
        component.set("v.Message2",msg);*/
    }
})