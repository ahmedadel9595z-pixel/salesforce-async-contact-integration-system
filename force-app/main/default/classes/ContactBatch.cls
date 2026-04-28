global class ContactBatch implements Database.Batchable<SObject>, Database.Stateful, Database.AllowsCallouts {

    global Integer successCount = 0;
    global Integer failCount = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Email FROM Contact'
        );
    }

    global void execute(Database.BatchableContext bc, List<Contact> scope) {

        for(Contact con : scope) {

            if(con.Email != null) {

                try {

                    HttpResponse res = ERPCalloutService.sendContact(con);

                    if(res.getStatusCode() == 200) {
                        successCount++;
                    } else {
                        failCount++;
                    }

                } catch(Exception e) {
                    failCount++;
                }
            }
        }
    }

    global void finish(Database.BatchableContext bc) {

        System.debug('Batch Completed');
        System.debug('Success: ' + successCount);
        System.debug('Failed: ' + failCount);

        System.enqueueJob(new ContactQueueable(successCount, failCount));
    }
}