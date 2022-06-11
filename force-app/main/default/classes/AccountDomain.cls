public with sharing class AccountDomain {
    
    List<String> industries = new List<String>{'A','B','C'};

    public static AccountDomain getInstance() {
        if(instance == null){
            instance = new AccountDomain();
        }
        return instance;
    }

    public void updatedAccountName (List<Account> accountNewList, Map<Id, Account> accountOldMap) {
        for(account accountRecord : accountNewList){
            if (accountRecord.name != accountOldMap.get(accountRecord.id).name) {
                accountRecord.name = accountRecord.name + ' - Updated';
            }
        }
    }
    
    public void verifyAccountRating (List<Account> accountNewList) {
        for(account accountRecord : accountNewList){
            if (accountRecord.AnnualRevenue > 1000){
                accountRecord.Rating = 'Hot';
            }
        }
    }
    
    public void validateAccountIndustry (List<Account> accountNewList) {
        for (Account accountRecord : accountNewList) {
            if (industries.contains(accountRecord.Industry)) {
                x.addError('INVALID INDUSTRY');
            }
        }
    }
}
