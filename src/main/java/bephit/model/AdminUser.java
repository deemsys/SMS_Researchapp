package bephit.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class AdminUser
{
	@NotEmpty
	private String admin_username;
	
	
	
	
	
	@NotEmpty
	@Email
	private String admin_email;
	
	@NotEmpty
	private String admin_password;
	
 
	
	@NotEmpty
	@Pattern(regexp="(^$|[0-9]{10})",message="Not a valid Mobile number")
	private String admin_mobile;
	
	@NotEmpty
	private String admin_address;
	
	
	private String previlages;
	
	
	private String date;
	
	private String addstream;
	private String editstream;
	private String deletestream;
	private String broadcaststream;
	private String addparticipant;
	private String editparticipant;
	private String deleteparticipant;
	private String addadminuser;
	private String edituser;
	private String deleteuser;
	private String modifysettings;
	private String mailtemplate;
	private String status;
	private String admin_id;
	
	
	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_mobile() {
		return admin_mobile;
	}

	public void setAdmin_mobile(String admin_mobile) {
		this.admin_mobile = admin_mobile;
	}

	public String getAdmin_address() {
		return admin_address;
	}

	public void setAdmin_address(String admin_address) {
		this.admin_address = admin_address;
	}

	public String getPrevilages() {
		return previlages;
	}

	public void setPrevilages(String previlages) {
		this.previlages = previlages;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAddstream() {
		if(addstream==null)
			return "0";
		else
		return addstream;
	}

	public void setAddstream(String addstream) {
		this.addstream = addstream;
	}

	public String getEditstream() {
		if(editstream==null)
			return "0";
		else
		return editstream;
	}

	public void setEditstream(String editstream) {
		this.editstream = editstream;
	}

	public String getDeletestream() {
		if(deletestream==null)
			return "0";
		else
		return deletestream;
	}

	public void setDeletestream(String deletestream) {
		this.deletestream = deletestream;
	}

	public String getBroadcaststream() {
		if(broadcaststream==null)
			return "0";
		else
		return broadcaststream;
	}

	public void setBroadcaststream(String broadcaststream) {
		this.broadcaststream = broadcaststream;
	}

	public String getAddparticipant() {
		if(addparticipant==null)
			return "0";
		else
		return addparticipant;
	}

	public void setAddparticipant(String addparticipant) {
		this.addparticipant = addparticipant;
	}

	public String getEditparticipant() {
		if(editparticipant==null)
			return "0";
		else
		return editparticipant;
	}

	public void setEditparticipant(String editparticipant) {
		this.editparticipant = editparticipant;
	}

	public String getDeleteparticipant() {
		if(deleteparticipant==null)
			return "0";
		else
		return deleteparticipant;
	}

	public void setDeleteparticipant(String deleteparticipant) {
		this.deleteparticipant = deleteparticipant;
	}

	public String getAddadminuser() {
		if(addadminuser==null)
			return "0";
		else
		return addadminuser;
	}

	public void setAddadminuser(String addadminuser) {
		this.addadminuser = addadminuser;
	}

	public String getEdituser() {
		if(edituser==null)
			return "0";
		else
		return edituser;
	}

	public void setEdituser(String edituser) {
		this.edituser = edituser;
	}

	public String getDeleteuser() {
		if(deleteuser==null)
			return "0";
		else
		return deleteuser;
	}

	public void setDeleteuser(String deleteuser) {
		this.deleteuser = deleteuser;
	}

	public String getModifysettings() {
		if(modifysettings==null)
			return "0";
		else
		return modifysettings;
	}

	public void setModifysettings(String modifysettings) {
		this.modifysettings = modifysettings;
	}

	public String getMailtemplate() {
		if(mailtemplate==null)
			return "0";
		else
		return mailtemplate;
	}

	public void setMailtemplate(String mailtemplate) {
		this.mailtemplate = mailtemplate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
 
	public AdminUser()
	{
	
	}
	
	public AdminUser(String admin_id,String admin_username,String admin_email,String admin_password,String admin_mobile,String admin_address,String previlages,String date,String status,String addstream,String editstream,String deletestream,String broadcaststream,String addparticipant,String editparticipant,String deleteparticipant,String addadminuser,String edituser,String deleteuser,String modifysettings,String mailtemplate)
	{
		this.admin_id=admin_id;
		this.admin_username=admin_username;
		this.admin_password=admin_password;
		
		
		this.admin_email=admin_email;
		this.admin_mobile=admin_mobile;
		this.admin_address=admin_address;
		this.previlages=previlages;
		this.date=date;
		this.status=status;
		this.addstream=addstream;
		this.editstream=editstream;
		this.deletestream=deletestream;
		this.broadcaststream=broadcaststream;
		this.addparticipant=addparticipant;
		this.editparticipant=editparticipant;
		this.deleteparticipant=deleteparticipant;
		this.addadminuser=addadminuser;
		this.edituser=edituser;
		this.deleteuser=deleteuser;
		this.modifysettings=modifysettings;
		this.mailtemplate=mailtemplate;
	}

	

	
	
}
