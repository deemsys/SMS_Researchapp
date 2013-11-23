package bephit.model;
import java.util.Map;
import java.util.HashMap;

import org.springframework.stereotype.Component;
 
import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.resource.instance.Sms;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.SmsFactory;

@Component("messageSender")
public class TwilioSMS {
	//---------Original Credential------------
	//public static final String ACCOUNT_SID = "AC786e7d442679f6354ffad69c823e8293"; //Store in DB
   //public static final String AUTH_TOKEN = "1fa46f72637ea7c1f51b758c486f9e66"; //Store in DB
	
	
	//-----------Test credentials--------------	
	public static final String ACCOUNT_SID = "ACc3b8379c7d3c8670b70941adeba1a531";
	public static final String AUTH_TOKEN = "094ba16d028e446f5e20cc41890b3a86";
	
	
    private void sendMessage(final String toNumber, final String MessageBody, final String mediaUrl) throws TwilioRestException {
 
        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
 
        Account account = client.getAccount();
 
        SmsFactory messageFactory = account.getSmsFactory();
        Map<String, String> smsParams = new HashMap<String, String>();
        smsParams.put("To", toNumber); 
       // smsParams.put("From", "6142598990"); // orginal valid phone number in your account. //Store in DB
        
        smsParams.put("From","+15005550006");//Magic number
        smsParams.put("Body", MessageBody);
        if(mediaUrl != null){
        	smsParams.put("MediaUrl", "http://demo.twilio.com/owl.png"); //Only for sending MMS
        }
        Sms sms = messageFactory.create(smsParams);
        
        System.out.println(sms.getStatus());
    }
    
    public void sendSMS(final String toNumber, final String MessageBody) throws TwilioRestException {
        sendMessage(toNumber, MessageBody, null);
    }

    public void sendMMS(final String toNumber, final String MessageBody, final String mediaUrl) throws TwilioRestException {
    	sendMessage(toNumber, MessageBody, mediaUrl);
    }

}
