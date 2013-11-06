package bephit.model;

import org.hibernate.validator.constraints.NotEmpty;

public class UpdatePwd {
	@NotEmpty
 private String PASSWORD;
	@NotEmpty
 private String old_pwd;
	@NotEmpty
 private String retype_pwd;
 
public UpdatePwd(String new_pwd, String old_pwd, String retype_pwd) {
	super();
	this.PASSWORD = new_pwd;
	this.old_pwd = old_pwd;
	this.retype_pwd = retype_pwd;
}
public String getPASSWORD() {
	return PASSWORD;
}
public void setPASSWORD(String pASSWORD) {
	PASSWORD = pASSWORD;
}
public String getOld_pwd() {
	return old_pwd;
}
public void setOld_pwd(String old_pwd) {
	this.old_pwd = old_pwd;
}
public String getRetype_pwd() {
	return retype_pwd;
}
public void setRetype_pwd(String retype_pwd) {
	this.retype_pwd = retype_pwd;
}
 
}
