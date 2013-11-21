package bephit.dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import bephit.controllers.MainController;
import bephit.model.EmailSender;
import bephit.model.ParticipantGroups;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import bephit.model.ParticipantsDetails;

public class MainDAO {
	private DataSource dataSource;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);//Logger
	private static final Random RANDOM = new SecureRandom();
	@Autowired  
	EmailSender emailSender;
	
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public int updateparticipantmessage(ParticipantsDetails participant,String participants_id,String admin)
	{
		Connection con = null;
		Statement statement = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 //System.out.println(dateFormat.format(date));
	    	String cmd="UPDATE participants_table SET message ='"+participant.getmessage()+"' WHERE participants_id='"+participants_id+"'";
	    	
	    	String Desc="Update participant "+participant.getFname();
	    	
	    	
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
	    	    	
	    	System.out.println("update message"+cmd);
	    	System.out.println(cmd_activity);
			
	    	statement.execute(cmd);
			statement.execute(cmd_activity);
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
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	
	}
	public  int checkuser(String admin_username)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	   
	      String cmd_userlist="Select count(*) as counting from participants_table where username='"+admin_username+"'";
          resultSet=statement.executeQuery(cmd_userlist);
          resultSet.next();
          int counts=Integer.parseInt(resultSet.getString("counting"));
          System.out.println(counts);
          if(counts>0)
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

	public  int checkemail(String admin_email,int from,String participantid)
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
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    
	      String cmd_emaillist="";
	          
	      if(from==0)
	       	     cmd_emaillist="Select count(*) as counting from participants_table where email_id='"+admin_email+"'";
	      else if(from==1)
	    	  cmd_emaillist="Select count(*) as counting from participants_table where email_id='"+admin_email+"' && participants_id!='"+participantid+"'";
	 	     	  
          resultSet=statement.executeQuery(cmd_emaillist);
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
          
          /*else
          {
        	  ResultSet rs=statement.executeQuery("Select count(*) as counting from participants_table where email_id='"+admin_email+"' and participant_id!='"+participantid+"'" );
    		  rs.next();
              int count1=Integer.parseInt(resultSet.getString("counting"));
        	  if(count1>0)
              {        		 
        		  return 0;
              }
              else
              {
                 return 1; 
              }
          }*/
          
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
	
	public  int checkmobile(String admin_mobile)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	   
	      String cmd_mobilelist="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"'";
          resultSet=statement.executeQuery(cmd_mobilelist);
          resultSet.next();
          int counts=Integer.parseInt(resultSet.getString("counting"));
          System.out.println(counts);
          if(counts>0)
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
	
	
	

	
	public int setParticipants(ParticipantsDetails participant, String admin_id,String[] groups) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// List<ParticipantsDetails> participants = new
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		
		
		
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println("providername"+participant.getProvider_name());
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (`fname`,`username`,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time2`,`time3`,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getFname()					
					+"','"
					+participant.getusername()
					+ "','"
					+ participant.getMobile_num()
					+ "','"
					+ participant.getGender()
					+ "','"
					+ participant.getCity()
					+ "','"
					+ participant.getEducation()
					+ "','"
					+ participant.getMedical_details()
					+ "','"
					+ participant.getTime1()
					+ "','"
					+participant.getTime2()
					+"','"
					+participant.getTime3()
					+"','"
					+userName
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','"+participant.getProvider_name()+"')";
			System.out.println(cmd);
			statement.execute(cmd);
			
			
			//Generate random password
			 
			 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";

		      String pw = "";
		      int PASSWORD_LENGTH=6;
			for (int i=0; i<PASSWORD_LENGTH; i++)
		      {
		          int index = (int)(RANDOM.nextDouble()*letters.length());
		          pw += letters.substring(index, index+1);
		      }
		    System.out.println("Password:"+pw);
		    
		    
			 
			 
			 
			 //end generate random password			
			
			//insert into role table
			String cmd_login="insert into login(username,password,email_id,role,status) values('"+participant.getusername()+"','"+pw+"','"+participant.getEmail_id()+"',0,1)";
			
			/*statement.execute(cmd);*/
			statement.execute(cmd_login);
			String cmd_getid="SELECT LAST_INSERT_ID() as lastid";
			System.out.println(cmd);
			/*String Desc="added adminuser"+admin_id;
			String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin_id+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
			System.out.println(cmd_activity);
			*/resultSet=statement.executeQuery(cmd_getid);
			resultSet.next();
			int lastinsertedid=Integer.parseInt(resultSet.getString("lastid"));
			System.out.println(lastinsertedid);
			String cmd_role="insert into user_roles(user_id,authority) values('"+lastinsertedid+"','ROLE_USER')";
			statement.execute(cmd_role);	
			//end insert
			try
			{
			//send mail password
			logger.info("--Before Sending--"); //Logger Test
		    //Email Test
		    emailSender.password_sendEmail(participant.getEmail_id(),"learnguild@gmail.com","Breast Cancer Research App Registration",participant.getFname(),participant.getusername(),pw);
		    
		    logger.info("--After Sent--");
			}
			catch(Exception ex)
			{
				
			}
			
			
			
			
			System.out.println("insertcmd"+cmd);
			
			resultSet= statement.executeQuery("select  max(participants_id) as participant from participants_table;");
			String participants="";
			if(resultSet.next())
				{
				participants=resultSet.getString("participant");
				}
			System.out.println("participants........."+participants);			
			List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();
					
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;
		 System.out.println("count"+count);
		
			System.out.println("group_id"+strlist);
			System.out.println("group_name"+strlist1);
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants+"')";
			statement.execute(cmd_mess);
			System.out.println("cmd_mess"+cmd_mess);
	     }			
			/*
			 * String cmd_getparticipantname=
			 * "select fname from participants_table where participants_id='"
			 * +participant_id+"'";
			 * resultSet=statement.executeQuery(cmd_getparticipantname);
			 */
		     String Desc = "added participants" + participant.getFname();
			/*
			 * if(resultSet.next()) Desc=Desc+resultSet.getString(1);
			 */
		     String cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"
					+ admin_id
					+ "','127.0.0.1','"
					+ dateFormat.format(date)
					+ "','" + Desc + "')";
			System.out.println(cmd_activity);
			statement.execute(cmd_activity);
			flag = 1;
		
		}
		catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			// return 0;
		} 
		finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		if (flag == 1)
			return 1;
		else
			return 0;
}
	
	public int setParticipants(ParticipantsDetails participant, String admin_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// List<ParticipantsDetails> participants = new
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println("providername"+participant.getProvider_name());
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (`fname`,`username`,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time2`,`time3`,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getFname()
					+ "','"
					+participant.getusername()
					+"','"
					+ participant.getMobile_num()
					+ "','"
					+ participant.getGender()
					+ "','"
					+ participant.getCity()
					+ "','"
					+ participant.getEducation()
					+ "','"
					+ participant.getMedical_details()
					+ "','"
					+ participant.getTime1()
					+ "','"
					+participant.getTime2()
					+"','"
					+participant.getTime3()
					+"','"
					+userName
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','"+userName+"')";
			System.out.println(cmd);
			statement.executeUpdate(cmd);
			System.out.println("insertcmd"+cmd);
			
			/*
			 * String cmd_getparticipantname=
			 * "select fname from participants_table where participants_id='"
			 * +participant_id+"'";
			 * resultSet=statement.executeQuery(cmd_getparticipantname);
			 */String Desc = "added participants" + participant.getFname();
			/*
			 * if(resultSet.next()) Desc=Desc+resultSet.getString(1);
			 */String cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"
					+ admin_id
					+ "','127.0.0.1','"
					+ dateFormat.format(date)
					+ "','" + Desc + "')";
			System.out.println(cmd_activity);
			statement.execute(cmd_activity);
			flag = 1;
		} catch (Exception e) {
			
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			// return 0;
		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		if (flag == 1)
			return 1;
		else
			return 0;

	}


	public int updateParticipants(ParticipantsDetails participant,String participants_id,String admin,String[] groups)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 //System.out.println(dateFormat.format(date));
	    	
	    	String Desc="Update participant "+participant.getFname();
	    	List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();				
			statement.executeUpdate("delete from participant_group where participant_id='"+participants_id+"'");
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;
		 System.out.println("count"+count);
		
			System.out.println("group_id"+strlist);
			System.out.println("group_name"+strlist1);
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants_id+"')";
			statement.execute(cmd_mess);
			System.out.println("cmd_mess"+cmd_mess);
	     }			
		
	    	
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
	    	String cmd="UPDATE participants_table SET fname ='"+participant.getFname()+"',username ='"+participant.getusername()+"',mobile_num ='"+participant.getMobile_num()+"',gender ='"+participant.getGender()+"'  ,city ='"+participant.getCity()+"' ,education = '"+participant.getEducation()+"',medical_details = '"+participant.getMedical_details()+"',time1='"+participant.getTime1()+"',time2='"+participant.getTime2()+"',time3='"+participant.getTime3()+"',Provider_name ='"+participant.getProvider_name()+"',group_name = '"+participant.getGroup_name()+"',age = '"+participant.getAge()+"',date_of_join = '"+dateFormat.format(date)+"',email_id = '"+participant.getEmail_id()+"' WHERE participants_id='"+participants_id+"';";    	
	    	System.out.println(cmd);
	    	System.out.println(cmd_activity);
			
	    	statement.execute(cmd);
			statement.execute(cmd_activity);
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
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	    
	}
	public  String getproviders(String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  System.out.println(((UserDetails) principal).getAuthorities());
		}
		String userName = userDetails.getUsername();	
		//give full permission to superadmin
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String name="";
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd;
			String role_admin="ROLE_ADMIN";
			cmd="select * from participants_table where participants_id='"+participantid+"'";
				
			resultSet = statement
					.executeQuery(cmd);
			System.out.print("username"+userName);
			if(resultSet.next()) {
				name=resultSet.getString("Provider_name");
								
			}
			System.out.println("name"+name);
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return name;


		
	}
	
	public List<ParticipantsDetails> getParticipants() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  System.out.println(((UserDetails) principal).getAuthorities());
		}
		String userName = userDetails.getUsername();
		
		//give full permission to superadmin
		
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd;
			String role_admin="ROLE_ADMIN";
			if(userName.equals("superadmin"))
				cmd="select * from participants_table";
				else
			    cmd="select * from participants_table where Provider_name='"+userName+"'";
				
			resultSet = statement
					.executeQuery(cmd);
			System.out.print("username"+userName);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"), resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"), resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return participants;

	}

	
	public int sendForgotpassword(String email)
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
            String cmd;
            
			cmd = "select * from admin_log_table where admin_email='"+email+"'";
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {

				//------------------------------------------------------------------------//
				
				System.out.println(email);
				logger.info("--Before Sending--"); //Logger Test
		        //Email Test
		        emailSender.password_sendEmail(email, "learnguild.com", "Forgot Password",resultSet.getString("admin_firstname"),resultSet.getString("admin_username"),resultSet.getString("admin_password"));
		        logger.info("--After Sent--");
		        flag=1;
		      /*  model.addAttribute("success","true");
		       */ 
		        try{
		        /*	messageSender.sendSMS("6144670389", "Deemsys test");
		       */ }catch(Exception e){e.printStackTrace();}
		        
		        
		      //------------------------------------------------------------------------//
				
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
	    if(flag==1)
	    {
	    	return 1;
	    }
	    else
	    	return 0;

	}
	public List<ParticipantsDetails> getlimitedParticipants(int page) {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
			if(userName.equals("superadmin"))
				   cmd="select * from participants_table  limit " + offset + ","+ limit+"" ;
				else
					cmd = "select * from participants_table where provider_name='"+userName+"' limit " + offset + ","+ limit+"" ;
							
				System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
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
		return participants;

	}

	public int getnoofParticipants() {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
				cmd = "select count(*) as noofrecords from participants_table";
				else
					cmd = "select count(*) as noofrecords from participants_table where provider_name='"+userName+"'";
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

	public int deleteParticipant(String participant_id, String admin) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String cmd_getparticipant_name = "select fname from participants_table where participants_id='"
					+ participant_id + "'";
			String Desc = "Delete participant ";

			resultSet = statement.executeQuery(cmd_getparticipant_name);
			String cmd_activity;
			if (resultSet.next())
				Desc = Desc + resultSet.getString(1);
			statement
					.execute("delete from participants_table where participants_id='"
							+ participant_id + "'");
			cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"
					+ admin
					+ "','127.0.0.1','"
					+ dateFormat.format(date)
					+ "','" + Desc + "')";
			statement.execute(cmd_activity);
			flag = 1;

		} catch (Exception e) {
			System.out.println(e.toString());
			flag = 0;
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {

			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		if (flag == 1)
			return 1;
		else
			return 0;
	}

	// Select only ParticularGroup

	public List<ParticipantsDetails> getParticipants(String mobile,
			String groupname, String city) {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			
			String cmd;
			if(userName.equals("superadmin"))
			cmd = "select * from participants_table where mobile_num='"
					+ mobile + "' or group_name='" + groupname + "' or city='"
					+ city + "'";
			else
				cmd=cmd = "select * from participants_table where mobile_num='"
				+ mobile + "' or group_name='" + groupname + "' or city='"
				+ city + "' having Provider_name='"+userName+"'";
	
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return participants;

	}

	public List<ParticipantsDetails> getParticipants(String participants_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd = "select * from participants_table where participants_id='"
					+ participants_id + "'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return participants;

	}
	
	public String getprovidername(String participantid)
	{
		
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			String participants = "";
			try {
				String cmd = "select Provider_name from participants_table where participants_id='"
						+ participantid + "'";
				resultSet = statement.executeQuery(cmd);
				System.out.println(cmd);
			if (resultSet.next()) {
					
								participants=resultSet.getString("Provider_name");
									
					
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			} finally {
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			return participants;
	
		}

	

	public HashMap<String, ArrayList<ParticipantsDetails>> getAllParticipants() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		HashMap<String, ArrayList<ParticipantsDetails>> ParticipantsMap = new HashMap<String, ArrayList<ParticipantsDetails>>();
		try {
			String cmd = "select * from participants_table";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while (resultSet.next()) {
				ParticipantsDetails p = (new ParticipantsDetails(
						resultSet
						.getString("participants_id"), resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				if (ParticipantsMap.containsKey(p.getGroup_name())) {
					ArrayList<ParticipantsDetails> participants = ParticipantsMap
							.get(p.getGroup_name());
					participants.add(p);
					ParticipantsMap.put(p.getGroup_name(), participants);
				} else {
					ParticipantsMap.put(p.getGroup_name(),
							new ArrayList<ParticipantsDetails>());
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return ParticipantsMap;
	}

	public List<ParticipantsDetails> getParticipantsbyGroupName(String grname) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd = "select * from participants_table where group_name="
					+ grname;
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while (resultSet.next()) {
				ParticipantsDetails p = (new ParticipantsDetails(
						resultSet
						.getString("participants_id"), resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time2"),
								resultSet.getString("time3"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				participants.add(p);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return participants;
	}

	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}
	
	public int getrole()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		int role=4;
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select role from login where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	role=Integer.parseInt(resultSet.getString("role"));
	    	flag=1;
	    	System.out.println(role);
	    	 
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
	    	
	    }
	    if(flag==1)
    		return role;
    	else
    		return 4;
	
	}
	public String getparticipantid()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		String p_id="";
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select participants_id from participants_table where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	p_id=resultSet.getString("participants_id");
	    	flag=1;
	    	System.out.println(p_id);
	    	 
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
	    	
	    }
	    if(flag==1)
    		return p_id;
    	else
    		return "65";
	
	}
	
	
	public  int checkuser(String admin_username,int from,String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_userlist="";
	    	if(from==0)	   
	      cmd_userlist="Select count(*) as counting from participants_table where username='"+admin_username+"'";
	    	else if(from==1)
	    		cmd_userlist="Select count(*) as counting from participants_table where mobile_num='"+admin_username+"' && participants_id!='"+participantid+"'";
	    	 resultSet=statement.executeQuery(cmd_userlist);
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

	public  int checkmobile(String admin_mobile,int from,String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_mobilelist="";
	    	if(from==0)	   
	    		cmd_mobilelist ="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"'";
	    	else if(from==1)
	    		cmd_mobilelist="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"' && participants_id!='"+participantid+"'";
		 	    
	    	resultSet=statement.executeQuery(cmd_mobilelist);
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

	
	
	
	
	
	
	

}
