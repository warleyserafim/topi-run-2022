/**
 * @author warleyameida - brq
 */

trigger Lead on Lead (before insert, before update, after insert, after update) {


    List<Lead> newLeads = Trigger.new;
    Map<Id, Lead> oldLeads = Trigger.oldMap;

    if (Trigger.operationType == TriggerOperation.BEFORE_INSERT) {

        

        System.debug('BEFORE_INSERT' + JSON.serialize(newLeads) + '\n\n' + JSON.serialize(oldLeads));
        
    }else if (Trigger.operationType == TriggerOperation.BEFORE_UPDATE) {

        System.debug('BEFORE_UPDATE' + JSON.serialize(newLeads) + '\n\n' + JSON.serialize(oldLeads));

        
    }else if (Trigger.operationType == TriggerOperation.AFTER_INSERT) {

        System.debug('AFTER_INSERT' + JSON.serialize(newLeads) + '\n\n' + JSON.serialize(oldLeads));

        
    }else if (Trigger.operationType == TriggerOperation.BEFORE_UPDATE) {

        System.debug('BEFORE_UPDATE' + JSON.serialize(newLeads) + '\n\n' + JSON.serialize(oldLeads));

        
    }

}