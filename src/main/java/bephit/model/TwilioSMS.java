package bephit.model;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.stereotype.Component;

import bephit.dao.MailTemplateDAO;
import bephit.forms.MailTemplateForm;

import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.resource.instance.Sms;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.SmsFactory;

@Component("messageSender")
public class TwilioSMS {
	MailTemplateDAO mailTemplateDAO;
	public static String ACCOUNT_SID; // Store

	// in
	// DB
	public static String AUTH_TOKEN; // Store
										// in
										// DB
	public static String FROM_PHONE_NUMBER;

	private void sendMessage(final String toNumber, final String MessageBody,
			final String mediaUrl) throws TwilioRestException {
		List<TextMsgSettings> settings = mailTemplateDAO.getMsgSettings();
		TextMsgSettings msd = settings.get(0);

		ACCOUNT_SID = msd.getAccount_sid();
		AUTH_TOKEN = msd.getAuth_token();
		FROM_PHONE_NUMBER = msd.getMob_num();

		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

		Account account = client.getAccount();

		SmsFactory messageFactory = account.getSmsFactory();
		Map<String, String> smsParams = new HashMap<String, String>();
		smsParams.put("To", toNumber);
		smsParams.put("From", FROM_PHONE_NUMBER); // Replace with a valid phone
													// number in your account.
													// //Store in DB
		smsParams.put("Body", MessageBody);
		if (mediaUrl != null) {
			smsParams.put("MediaUrl", "http://demo.twilio.com/owl.png"); // Only
																			// for
																			// MMS
		}
		Sms sms = messageFactory.create(smsParams);

		System.out.println(sms.getStatus());
	}

	public void sendSMS(final String toNumber, final String MessageBody)
			throws TwilioRestException {
		sendMessage(toNumber, MessageBody, null);
	}

	public void sendMMS(final String toNumber, final String MessageBody,
			final String mediaUrl) throws TwilioRestException {
		sendMessage(toNumber, MessageBody, mediaUrl);
	}

}
