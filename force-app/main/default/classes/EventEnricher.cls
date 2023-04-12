/**
 * @author warleyalmeida - brq
 */

public  class EventEnricher {

    private String DESCRIPTION = Label.LBL_0001;
    private String SUBJECT = Label.LBL_0002;

    public List<Event> enrichEventForClientPremiunAndAnnualRevanueOneMillion ( List<Account> accounts) {

        List<Event> cretatedEvent = new List<Event>();

        EventRepository repository = new EventRepository();

        for(Account account : accounts) {
            Event event = new Event();
            Datetime toDate = Datetime.now();
            event.Description = DESCRIPTION;
            event.Subject = SUBJECT;
            event.StartDateTime = toDate.addDays(1);
            event.EndDateTime = toDate.addDays(1).addHours(1);
            event.WhatId = account.Id;
            event.ContactType__c = 'Telefonico';
            cretatedEvent.add(event);
        }

        return repository.create(cretatedEvent);

    }

}