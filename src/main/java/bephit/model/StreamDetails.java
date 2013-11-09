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
    private String message_id;
    private String stream_message;
    
     
    public StreamDetails(String streamId,String admin_username, String streamName, String description, String count) {
	    super();
		this.streamId = streamId;
		this.admin_username=admin_username;
		this.streamName = streamName;		
		this.description = description;
		this.message_count=count;
    }	
    public String getstream_message()
    {
    	return stream_message;
    }
    public void setstream_message()
    {
    	this.stream_message=stream_message;
    }
    public String getMessage_id() {
		return message_id;
	}
    public void setMessage_id(String message_id) {
		this.message_id = message_id;
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
