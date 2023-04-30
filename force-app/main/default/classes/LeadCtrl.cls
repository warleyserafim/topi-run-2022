/**
 * @author warleyalmeida - brq
 */

 @RestResource(urlMapping = '/api/lead')
global with sharing class LeadCtrl {

    public static LeadRepository leadRepository;
    public static TaskRepository taskRepository;

    static {
        leadRepository = new LeadRepository();
        taskRepository = new TaskRepository();
    }
   

    @HttpPost
    global static void create(Lead lead) {

        RestResponse response = RestContext.response;
        response.statusCode = 200;

        try{
        leadRepository.create(lead);

        Task task = new Task();
        task.Subject = 'Realizar Apresentação para o Prospect';
        task.WhoId = lead.Id;
        task.Status = 'Open';

        taskRepository.create(task);

        response.responseBody =  Blob.valueOf(JSON.serialize(lead));

        } catch (DmlException e) {
            response.responseBody = Blob.valueOf(JSON.serialize(new LeadErrorResponse(e.getDmlMessage(0))));
            response.statusCode = 400;
        } catch (Exception e) {
            response.responseBody = Blob.valueOf(JSON.serialize(new LeadErrorResponse(e.getDmlMessage(0))));
            response.statusCode = 400;
        }

    }

    @HttpGet
    global static Lead show() {

        RestRequest request = RestContext.request;

        String leadId = request.params.get('Id');

        return leadRepository.findById(leadId);
    }


    public class LeadServiceException extends Exception {
        
    }

    public class LeadErrorResponse {
        public String message;

        public LeadErrorResponse(String message) {
            this.message = message;
        }

    }
}