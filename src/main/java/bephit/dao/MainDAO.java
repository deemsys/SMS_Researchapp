package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

import bephit.model.ParticipantsDetails;

public class MainDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public int setParticipants(ParticipantsDetails participant)
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
	    	 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 //System.out.println(dateFormat.format(date));
	    	String cmd="INSERT INTO `participants_table` (`fname`,`lname`,`mobile_num`,`gender`,`city`,`education`,`note`,`medical_details`,`messaging_frequency`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"+participant.getFname()+"','"+participant.getLname()+"','"+participant.getMobile_num()+"','"+participant.getGender()+"','"+participant.getCity()+"','"+participant.getEducation()+"','"+participant.getNote()+"','"+participant.getMedical_details()+"','"+participant.getMessaging_frequency()+"','"+participant.getGroup_name()+"','"+participant.getAge()+"','"+dateFormat.format(date)+"','"+participant.getEmail_id()+"','0')";
	    	System.out.println(cmd);
			statement.execute(cmd);
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
	
	
	
	public int updateParticipants(ParticipantsDetails participant,String participants_id)
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
	    	String cmd="UPDATE participants_table SET fname ='"+participant.getFname()+"',lname ='"+participant.getLname()+"',mobile_num ='"+participant.getMobile_num()+"',gender ='"+participant.getGender()+"'  ,city ='"+participant.getCity()+"' ,education = '"+participant.getEducation()+"',note = '"+participant.getNote()+"',medical_details = '"+participant.getMedical_details()+"',messaging_frequency = '"+participant.getMessaging_frequency()+"',group_name = '"+participant.getGroup_name()+"',age = '"+participant.getAge()+"',date_of_join = '"+dateFormat.format(date)+"',email_id = '"+participant.getEmail_id()+"' WHERE participants_id='"+participants_id+"';";    	
	    	System.out.println(cmd);
			statement.execute(cmd);
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
	
	
	
	
	public List<ParticipantsDetails> getParticipants(){
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
	    try{
			resultSet = statement.executeQuery("select * from participants_table");
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	
	public List<ParticipantsDetails> getlimitedParticipants(int page){
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
	    try{
	        
	    	String cmd;	
	    	int offset=5*(page-1);
	    	int limit=5;  	
	    	
	    	cmd="select * from participants_table limit "+offset+","+limit;
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	
	
	
	
	public int getnoofParticipants(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords=0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	        
	    	String cmd;	
	    	cmd="select count(*) as noofrecords from participants_table";
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			if(resultSet.next())
				noofRecords=resultSet.getInt("noofrecords");
			
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return noofRecords;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int deleteParticipant(String participant_id){
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
			statement.execute("delete from participants_table where participants_id='"+participant_id+"'");
			flag=1;
			
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	flag=0;
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	   		if(flag==1)
	   			return 1;
	   		else
	   			return 0;
	}
	
	//Select only ParticularGroup
	
	public List<ParticipantsDetails> getParticipants(String mobile,String groupname,String city){
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
	    try{
	    	String cmd="select * from participants_table where mobile_num='"+mobile+"' or group_name='"+groupname+"' or city='"+city+"'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	public List<ParticipantsDetails> getParticipants(String participants_id){
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
	    try{
	    	String cmd="select * from participants_table where participants_id='"+participants_id+"'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);			
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
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
