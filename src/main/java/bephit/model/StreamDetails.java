package bephit.model;

import org.hibernate.validator.constraints.NotEmpty;

public class StreamDetails {

	public StreamDetails()
	{
		
	}
	
	

	private String streamId;
	
	
	@NotEmpty
	private String streamName;
	
	
	@NotEmpty
	private String description;
	
	
	private String admin_username;
	
	private String message_count; 
	public StreamDetails(String streamId, String streamName,String admin_username,String description,String count
			) {
		super();
		this.streamId = streamId;
		this.streamName = streamName;
		this.description = description;
		this.setAdmin_username(admin_username);
		this.message_count=count;
	}
	
	public String getMessage_count() {
		return message_count;
	}

	public void setMessage_count(String message_count) {
		this.message_count = message_count;
	}

	public String getStreamId() {
		return streamId;
	}

	public void setStreamId(String streamId) {
		this.streamId = streamId;
	}

	public String getStreamName() {
		return streamName;
	}

	public void setStreamName(String streamName) {
		this.streamName = streamName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	
}
