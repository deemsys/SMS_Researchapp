package bephit.model;


import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class ParticipantGroups {
	private String group_id;
	
	
	@NotEmpty
	private String group_name;
	
	@NotEmpty
	private String group_scope;
	
	@NotEmpty
	private String group_decs;
	
	@NotEmpty
	private String select_local_group;
	
	@NotEmpty
	private String local_city;
	
	@NotEmpty
	private String local_dojfrom;
	
	@NotEmpty
	private String local_dojto;
	@NotEmpty
	private String local_age;
	
	@NotEmpty
	private String local_educations;
	
	public ParticipantGroups()
	{
		
	}	
	public ParticipantGroups(String group_id,
	 String group_name,
	 String group_scope,
	 String group_decs,
	 String select_local_group,
	 String local_city,
	 String local_dojfrom,
	 String local_dojto,
	 String local_age,
	 String local_educations)
	{
		this.group_id=group_id;
		 this.group_name=group_name;
		 this.group_scope=group_scope;
		 this.group_decs=group_decs;
		 this.select_local_group=select_local_group;
		 this.local_city=local_city;
		 this.local_dojfrom=local_dojfrom;
		 this.local_dojto=local_dojto;
		 this.local_age=local_age;
		 this.local_educations=local_educations;		
	}
	public String getgroup_id()
	{
		return group_id;
	}
	public void setgroup_id(String group_id)
	{
		this.group_id=group_id;
	}
	public String getgroup_name()
	{
		return group_name;
	}
	public void setgroup_name(String group_name)
	{
		this.group_name=group_name;
	}
	public String getgroup_scope()
	{
		return group_scope;
	}
	public void setgroup_scope(String group_scope)
	{
		this.group_scope=group_scope;
	}
	public String getgroup_decs()
	{
		return group_decs;
	}
	public void setgroup_decs(String group_decs)
	{
		this.group_decs=group_decs;
	}
	public String getselect_local_group()
	{
		return select_local_group;
	}
	public void setselect_local_group(String select_local_group)
	{
		this.select_local_group=select_local_group;
	}
	public String getlocal_city()
	{
		return local_city;
	}
	public void setlocal_city(String local_city)
	{
		this.local_city=local_city;
	}
	public String getlocal_dojfrom()
	{
		return local_dojfrom;
	}
	public void setlocal_dojfrom(String local_dojfrom)
	{
		this.local_dojfrom=local_dojfrom;
	}
	public String getlocal_dojto()
	{
		return local_dojto;
	}
	public void setlocal_dojto(String local_dojto)
	{
		this.local_dojto=local_dojto;
	}
	public String getlocal_age()
	{
		return local_age;
	}
	public void setlocal_age(String local_age)
	{
		this.local_age=local_age;
	}
	public String getlocal_educations()
	{
		return local_educations;
	}
	public void setlocal_educations(String local_educations)
	{
		this.local_educations=local_educations;
	}
		
	
}
