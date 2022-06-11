public with sharing class AccountTriggerHandler extends TriggerHandler {
    
    public override void beforeInsert () {
        AccountDomain.getInstance().verifyAccountRating((List<Account>) Trigger.new);
    }
    
    public override void beforeUpdate () {
        AccountDomain.getInstance().updatedAccountName((List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap);
        AccountDomain.getInstance().verifyAccountRating((List<Account>) Trigger.new);
    }
    
    //public override void beforeDelete () {}
    
    // public override void afterInsert () {}
    
    public override void afterUpdate () {
        AccountDomain.getInstance().validateAccountIndustry((List<Account>) Trigger.new);
    }
    
    // public override void afterDelete () {}
    
    //public override void afterUndelete () {}
}
