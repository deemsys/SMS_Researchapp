package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import bephit.forms.ParticipantsGroupForm;
import bephit.model.ParticipantGroups;
import bephit.model.ParticipantsDetails;
import bephit.model.UserProfile;

public class ParticipantGroupDAO {
	private DataSource dataSource;
	 
		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}
		
		public  List<String> getGroups(String providername)
		{
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			int flag=0;
			List<String> participantgroup = new ArrayList<String>();
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		    try{
		    	int enabled=1;
		    	int updateemail=1;
		      String cmd_groupslist="select * from participant_group_table where created_by='"+providername+"'";
	          System.out.println(cmd_groupslist);
				resultSet=statement.executeQuery(cmd_groupslist);
	          while(resultSet.next())
	          {
	        	  
	          participantgroup.add(resultSet.getString("group_name"));
	          
	          }
	          System.out.println("participant"+participantgroup);
	           
				flag=1;
		 }
		    catch(Exception e){
		    	System.out.println(e.toString());
		    	releaseStatement(statement);
		    	releaseConnection(con);
		    	flag=0;
		    	//return 0;
		    }finally{
		     	releaseStatement(statement);
		    	releaseConnection(con);	    
		    	//if(flag==1)
		    		//return 1;
		    	//else
		    		//return 0;
		    }
		    return participantgroup;
		}
		
		
		public  List<String> getparticipantGroups(String participantid)
		{
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			int flag=0;
			List<String> participantgroup = new ArrayList<String>();
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		    try{
		    	int enabled=1;
		    	int updateemail=1;
		      String cmd_groupslist="select * from participant_group where participant_id='"+participantid+"'";
	          System.out.println(cmd_groupslist);
				resultSet=statement.executeQuery(cmd_groupslist);
	          while(resultSet.next())
	          {
	        	  
	          participantgroup.add(resultSet.getString("group_name"));
	          
	          }
	          System.out.println("participant group"+participantgroup);
	           
				flag=1;
		 }
		    catch(Exception e){
		    	System.out.println(e.toString());
		    	releaseStatement(statement);
		    	releaseConnection(con);
		    	flag=0;
		    	//return 0;
		    }finally{
		     	releaseStatement(statement);
		    	releaseConnection(con);	    
		    	//if(flag==1)
		    		//return 1;
		    	//else
		    		//return 0;
		    }
		    return participantgroup;
		}
		
		
		
	public int setParticipantGroup(ParticipantGroups pgroups)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName1 = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	
	    	//String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
          String cmd_pgroups="INSERT INTO `participant_group_table`(`group_name`,`group_decs`,created_by) VALUES('"+pgroups.getgroup_name()+"','"+pgroups.getgroup_decs()+"','"+userName1+"')";
          System.out.println(cmd_pgroups);
			statement.execute(cmd_pgroups);
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	     }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	    
	}
	
	
	public int deleteParticipantgroup(String group_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	int local_age;
	    	/*if(Integer.parseInt(pgroups.getgroup_scope())==0)
	    	local_age=0;
	    	else
	    		local_age=Integer.parseInt(pgroups.getlocal_age());*/
	    	 //System.out.println(dateFormat.format(date));
	    	//String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
          String cmd_pgroups="delete from participant_group_table where group_id='"+group_id+"'";
          System.out.println(cmd_pgroups);
			statement.execute(cmd_pgroups);
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	     }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	}
	
	
	
	
	
	public  List<ParticipantGroups> getGroups()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		 
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
          if(userName.equals("superadmin"))
	      cmd_groupslist="Select * from `participant_group_table`";
          else
        	    cmd_groupslist="Select * from `participant_group_table` where created_by='"+userName+"'";
            
          System.out.println(cmd_groupslist);
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	public  List<ParticipantGroups> getAllGroups()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();*/		
	/*	UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		 */
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
          /*if(userName.equals("superadmin"))*/
	      cmd_groupslist="Select * from `participant_group_table`";
         /* else
        	    cmd_groupslist="Select * from `participant_group_table`";
            */
          System.out.println(cmd_groupslist);
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	
	
	
	public  List<ParticipantGroups> getGroupsbyprovider(String provider)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
        
        	    cmd_groupslist="Select * from `participant_group_table` where created_by='"+provider+"'";
            
          System.out.println(cmd_groupslist);
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	public  List<ParticipantGroups> getparticularGroups(String id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		   //userName="suresh";
		}
		userName = userDetails.getUsername();
		 
		/*else
		   userName="suresh";	*/
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
 if(userName.equals("superadmin"))
 {
	      cmd_groupslist="Select * from `participant_group_table` where group_id='"+id+"'";
 }
 else
 {
	   cmd_groupslist="Select * from `participant_group_table` where created_by='"+userName+"' and group_id='"+id+"'";
 
 }
          System.out.println(cmd_groupslist);
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	public  int checkGroupname(String pgroups)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		   
		}
		userName = userDetails.getUsername();
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
	    	if(userName.equals("superadmin"))
	    	  	  cmd_groupslist="Select count(*) as counting from `participant_group_table` where group_name='"+pgroups+"'";
	  	    else
	    	      cmd_groupslist="Select count(*) as counting from `participant_group_table` where group_name='"+pgroups+"'";
	      resultSet=statement.executeQuery(cmd_groupslist);
          resultSet.next();
          int count=Integer.parseInt(resultSet.getString("counting"));
          System.out.println(count);
          if(count>0)
          {
        	  return 0;
          }
          else
          {
              return 1;
          }
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    
	}
	
	
	public  String getGroupName(String group_id)
	{
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String  participantgroupName = null;
	try {
	con = dataSource.getConnection();
	statement = con.createStatement();
	} catch (SQLException e1) {
	e1.printStackTrace();
	}
	//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	   try{
	   	
	     String cmd_group="Select group_name from `participant_group_table` where group_id="+group_id;
	          System.out.println(cmd_group);
	resultSet=statement.executeQuery(cmd_group);
	          while(resultSet.next())
	          {
	         
	         resultSet.getString("group_name");
	          }
	           
	}
	   catch(Exception e){
	   	System.out.println(e.toString());
	   	releaseStatement(statement);
	   	releaseConnection(con);
	   
	   	//return 0;
	   }finally{
	    releaseStatement(statement);
	   	releaseConnection(con);	   
	   	//if(flag==1)
	   	//return 1;
	   	//else
	   	//return 0;
	   }
	   return participantgroupName;
	}
	
	public List<ParticipantGroups> getlimitedParticipants_group(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
			if(userName.equals("superadmin"))
				cmd="select * from participant_group_table limit " + offset + ","+ limit+"";
			else
			cmd = "select * from participant_group_table where created_by='"+userName+"' limit " + offset + ","+ limit+"" ;
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				  participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
			        
			}
		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return participantgroup;

	}

	public int getnoofParticipants_group() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
			cmd = "select count(*) as noofrecords from participant_group_table";
			else
				cmd = "select count(*) as noofrecords from participant_group_table where created_by='"+userName+"'";
				
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}
	
	
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}
	
	
	
	
	
	
	
}
