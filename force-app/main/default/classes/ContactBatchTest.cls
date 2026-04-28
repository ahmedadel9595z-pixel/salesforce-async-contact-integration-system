@isTest
public class ContactBatchTest {

    @isTest
    static void testBatch() {

        List<Contact> cons = new List<Contact>();

        for(Integer i = 0; i < 5; i++) {
            cons.add(new Contact(
                LastName = 'Test ' + i,
                Email = 'test' + i + '@mail.com'
            ));
        }

        insert cons;

        Test.setMock(HttpCalloutMock.class, new MockCallout());

        Test.startTest();

        Database.executeBatch(new ContactBatch(), 2);

        Test.stopTest();
    }
}