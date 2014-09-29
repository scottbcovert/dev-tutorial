public with sharing class MyController {
    private final Account acct;  

    // The constructor passes in the standard controller defined
    // in the markup below
    public MyController(ApexPages.StandardSetController controller) {
        this.acct = (Account)controller.getRecord(); 
    }    
    
    public ApexPages.StandardSetController accountRecords {
        get {
            if(accountRecords == null) {
                accountRecords = new ApexPages.StandardSetController(
                    Database.getQueryLocator([SELECT Name FROM Account WHERE Id NOT IN 
                        (SELECT AccountId FROM Opportunity WHERE IsClosed = true)]));
            }
            return accountRecords;
        }
        private set;
    }
    public List<Account> getAccountPagination() {
         return (List<Account>) accountRecords.getRecords();
    }  
}
