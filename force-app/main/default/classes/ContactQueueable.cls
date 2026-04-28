public class ContactQueueable implements Queueable {

    Integer successCount;
    Integer failCount;

    public ContactQueueable(Integer successCount, Integer failCount) {
        this.successCount = successCount;
        this.failCount = failCount;
    }

    public void execute(QueueableContext context) {

        System.debug('=== Integration Summary ===');
        System.debug('Success Count: ' + successCount);
        System.debug('Fail Count: ' + failCount);
    }
}