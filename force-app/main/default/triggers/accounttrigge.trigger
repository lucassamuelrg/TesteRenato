/**
 * Please refactor this
 * TIP: use a prettier
 *      npm install --save-dev --save-exact prettier prettier-plugin-apex
 * keep in mind that it doesn't exists a perfect code and we can always improve it
 * so, free your mind and feel free to use Salesforce resources as custom metadatas, custom settings, etc
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