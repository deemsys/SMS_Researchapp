package bephit.model;

import org.hibernate.validator.constraints.NotEmpty;

public class BroadCast {
 
	private String br_id;
	
	@NotEmpty
	private String broad_id;
	
	@NotEmpty
	private String stream_id;
	
	@NotEmpty
	private String group_id;
	
	@NotEmpty
	private String frequency;
	
	@NotEmpty
	private String start_date;
	
	@NotEmpty
	private String fstream_time;
	
	@NotEmpty
	private String sstream_time;
	
	@NotEmpty
	private String stream_week_day;

	private String status;
	
	public BroadCast()
	{
	
	}
	public BroadCast(String broad_id,
			String stream_id,
			String group_id, 
			String frequency,
			String start_date,
			String fstream_time,
			String sstream_time,
			String stream_week_day,
			String status) {
		super();
		/*this.br_id = br_id;*/
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.group_id = group_id;
		this.frequency = frequency;
		this.start_date = start_date;
		this.fstream_time = fstream_time;
		this.sstream_time = sstream_time;
		this.stream_week_day = stream_week_day;
		this.status = status;
	}
	/*public String getBr_id() {
		return br_id;
	}
	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}*/
	public String getBroad_id() {
		return broad_id;
	}
	public void setBroad_id(String broad_id) {
		this.broad_id = broad_id;
	}
	public String getStream_id() {
		return stream_id;
	}
	public void setStream_id(String stream_id) {
		this.stream_id = stream_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getFstream_time() {
		return fstream_time;
	}
	public void setFstream_time(String fstream_time) {
		this.fstream_time = fstream_time;
	}
	public String getSstream_time() {
		return sstream_time;
	}
	public void setSstream_time(String sstream_time) {
		this.sstream_time = sstream_time;
	}
	public String getStream_week_day() {
		return stream_week_day;
	}
	public void setStream_week_day(String stream_week_day) {
		this.stream_week_day = stream_week_day;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
