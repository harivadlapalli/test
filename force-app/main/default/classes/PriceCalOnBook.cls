/*public class PriceCalOnBook {
    public static void calculateBooksPrice(List<LBook__c> newList){
        List<LBook__c> lbooksToUpdate = new List<LBook__c>();
        for(LBook__c lb : newList){
            if(lb.Name_Of_The_Book__c == 'Java' ){
                if(lb.Quantity__c < 100){
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 50) * 0.90);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 50 and Discount: 10%';
                } else {
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 50) * 0.85);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 50 and Discount: 15%';
                }
                lbooksToUpdate.add(lb);
            }
            if(lb.Name_Of_The_Book__c == 'Salesforce' ){
                if(lb.Quantity__c < 100){
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 60) * 0.90);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 60 and Discount: 10%';
                } else {
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 60) * 0.85);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 60 and Discount: 15%';
                }
                lbooksToUpdate.add(lb);
            }
            if(lb.Name_Of_The_Book__c == 'DevOps' ){
                if(lb.Quantity__c < 100){
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 70) * 0.90);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 70 and Discount: 10%';
                } else {
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 70) * 0.85);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 70 and Discount: 15%';
                }
                lbooksToUpdate.add(lb);
            }
            if(lb.Name_Of_The_Book__c == '.Net' ){
                if(lb.Quantity__c < 100){
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 80) * 0.90);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 80 and Discount: 10%';
                } else {
                    lb.Total_Books_Price__c = Math.round((lb.Quantity__c * 80) * 0.85);
                    lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: 80 and Discount: 15%';
                }
                lbooksToUpdate.add(lb);
            }
        }
    }
} */

public class PriceCalOnBook {
    public static void calculateBooksPrice(List<LBook__c> newList) {
        List<LBook__c> lbooksToUpdate = new List<LBook__c>();
        
        for (LBook__c lb : newList) {
            /*if(lb.Name_Of_The_Book__c == 'Java' && lb.Quantity__c < 100){
                lb.Total_Books_Price__c = math.round((lb.Quantity__c*50)*10/100);
                lb.Decsription__c = lb.Name_Of_The_Book__c+' '+ 'Price Rs.50/-, Discount is 10%';
            }*/
            
            Decimal bookPrice = 0;
            Decimal discountRate = 0;
            
            if (lb.Quantity__c < 100) {
                discountRate = 0.10;
            } else {
                discountRate = 0.15;
            }
            
            if (lb.Name_Of_The_Book__c == 'Java') {
                bookPrice = 50;
            } else if (lb.Name_Of_The_Book__c == 'Salesforce') {
                bookPrice = 60;
            } else if (lb.Name_Of_The_Book__c == 'DevOps') {
                bookPrice = 70;
            } else if (lb.Name_Of_The_Book__c == '.Net') {
                bookPrice = 80;
            }
            
            lb.Total_Books_Price__c = calculateTotalPrice(lb.Quantity__c, bookPrice, discountRate);
            lb.Decsription__c = 'Book Name: ' + lb.Name_Of_The_Book__c + ', Book Price: ' + bookPrice + 
                ' and Discount: ' + (discountRate * 100) + '%';
            lbooksToUpdate.add(lb);
        }
    }
    
    private static Decimal calculateTotalPrice(Decimal quantity, Decimal price, Decimal discountRate) {
        return Math.round((quantity * price) * (1 - discountRate));
    }
}