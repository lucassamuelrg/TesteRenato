/**
 * Please refactor this!!!!!!!!!!!!
 * =================== TIP - START ====================
 * open the terminal and run this to install a prettier plugin in your VSCode:
  npm install --save-dev --save-exact prettier prettier-plugin-apex
  the .prettierrc file must have:
    "tabWidth": 4
    "printWidth": 160
* ==================== TIP - END ========================
 * keep in mind that it doesn't exists a perfect code and we can always improve it
 * so, free your mind and feel free to use Salesforce resources as custom metadatas, custom settings, etc
 * you can create other triggers/classes/etc as well
 * if, at some point, you have that feeling of "WHAT THE FUCK?" .. no worries, you probably is right...
 * just trust in yourself... I wrote a TERRIBLE code :)
 * 
 * if you have any questions , send me a message
 */

trigger accounttrigge on account (before insert,before update, before delete, after insert, after update, after delete, after undelete) {

    List<String> industries = new List<String>{'A','B','C'};
    
        for(account x : trigger.newMap.values()){
            if (x.name != trigger.oldmap.get(x.id).name) {
                x.name = x.name + ' - Updated';
            }
            if (x.AnnualRevenue > 1000){
                x.Rating = 'Hot';
            }
        }

        if(trigger.isafter && trigger.isUpdate){
            account x = trigger.new[0];
            boolean stop;
            for (integer i = 0; i < industries.size(); i++){
                string industry = industries[i];
                if (x.Industry == industry) {
                    stop = true;
                    break;
                }
            }
            if(stop){
                x.addError('INVALID INDUSTRY');
            }
        }
    
}