public class MyController {

    public Account account { get; private set; }

    public MyController() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() : 
            [SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
    }

    public PageReference save() {
        try {
            upsert(account);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        //  After Save, navigate to the default view page:
        return (new ApexPages.StandardController(account)).view();
    }
}
