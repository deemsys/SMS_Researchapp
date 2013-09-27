package bephit.model;

import org.apache.commons.logging.Log;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class AdminActivity {
	private static final long serialVersionUID = 1L;
	
	private String log_id;
	
	private String admin_id;
	
	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getIp_address() {
		return ip_address;
	}

	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}

	public String getAdmin_date_time() {
		return admin_date_time;
	}

	public void setAdmin_date_time(String admin_date_time) {
		this.admin_date_time = admin_date_time;
	}

	public String getAdmin_desc() {
		return admin_desc;
	}

	public void setAdmin_desc(String admin_desc) {
		this.admin_desc = admin_desc;
	}

	private String ip_address;
	
	private String admin_date_time;
	
	private String admin_desc;
	
	
	
	public AdminActivity()
	{
		
	}	
	public AdminActivity(String log_id,
	 String admin_id,
	 String ip_address,
	 String admin_date_time,
	 String admin_desc)
	{
	this.log_id=log_id;
	this.admin_id=admin_id;
	this.ip_address=ip_address;
	this.admin_date_time=admin_date_time;
	this.admin_desc=admin_desc;
	}
}
