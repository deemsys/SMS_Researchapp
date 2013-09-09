package bephit.model;

public class ParticipantsDetails {
	private String participants_id;
	private String fname;
	private String lname;
	private String mobile_num;
	private String gender;
	private String city;
	private String education;
	private String note;
	private String medical_details;
	private String messaging_frequency;
	private String group_name;
	private String age;
	private String date_of_join;
	private String email_id;
	private String created_by;
	
	public ParticipantsDetails() {
    }
 
    public ParticipantsDetails(String participants_id,
    		String fname,
    		String lname,
    		String mobile_num,
    		String gender,
    		String city,
    		String education,
    		String note,
    		String medical_details,
    		String messaging_frequency,
    		String group_name,
    		String age,
    		String date_of_join,
    		String email_id,
    		String created_by) {
		this.participants_id = participants_id;
		this.fname = fname;
		this.lname = lname;
		this.mobile_num = mobile_num;
		this.gender = gender;
		this.city = city;
		this.education = education;
		this.note = note;
		this.medical_details = medical_details;
		this.messaging_frequency = messaging_frequency;
		this.group_name = group_name;
		this.age = age;
		this.date_of_join = date_of_join;
		this.email_id = email_id;
		this.created_by = created_by;
    }
	
	public String getParticipants_id() {
		return participants_id;
	}
	public void setParticipants_id(String participants_id) {
		this.participants_id = participants_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getMobile_num() {
		return mobile_num;
	}
	public void setMobile_num(String mobile_num) {
		this.mobile_num = mobile_num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getMedical_details() {
		return medical_details;
	}
	public void setMedical_details(String medical_details) {
		this.medical_details = medical_details;
	}
	public String getMessaging_frequency() {
		return messaging_frequency;
	}
	public void setMessaging_frequency(String messaging_frequency) {
		this.messaging_frequency = messaging_frequency;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getDate_of_join() {
		return date_of_join;
	}
	public void setDate_of_join(String date_of_join) {
		this.date_of_join = date_of_join;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

}
