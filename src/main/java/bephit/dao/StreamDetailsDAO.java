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

import bephit.model.AdminUser;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

public class StreamDetailsDAO
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String getMaxStreamID(){
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
		String StreamID="1001";
	    try{
			resultSet = statement.executeQuery("select Max(stream_id) as streamid from stream");
			int stream_id=0;
			if(resultSet.next())
			{
				stream_id=Integer.parseInt(resultSet.getString("streamid"));
				stream_id=stream_id+1;	
				StreamID=Integer.toString(stream_id);
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
	    return StreamID;
		
	}

	
	public int insertNewstream(StreamDetails streamdetails,String admin_id,String[] Messages)
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
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try
		{
						 
			String cmd_mess="";
	int count=1;
	for(String message :Messages)
	{		
	System.out.println(message);	
	cmd_mess="insert into message_stream(stream_id,stream_message,msg_count) values('"+streamdetails.getStreamId()+"','"+message+"','"+count+"')";
	count++;
	statement.execute(cmd_mess);
	}
	String cmd="insert into stream values('"+streamdetails.getStreamId()+"','"+admin_id+"','"+streamdetails.getStreamName()+"','"+streamdetails.getTextingcontacts()+"','"+streamdetails.getDescription()+"','"+(count-1)+"','"+userName+"')";
	
	System.out.println(cmd);
	statement.execute(cmd);
	flag=1;
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	public int insertmessage(StreamDetails streamdetails,String admin_id,String[] sample)
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
		try
		{
						 
			String cmd_mess="";
			System.out.println("insert sample"+sample);
			int count=1;
			for(String message :sample)
			{		
			System.out.println(message);	
			cmd_mess="insert into message_stream(stream_id,stream_message,msg_count) values('"+streamdetails.getStreamId()+"','"+message+"','"+count+"')";
			count++;
			statement.execute(cmd_mess);
			}
			String cmd="UPDATE stream SET stream_name='"+streamdetails.getStreamName()+"', stream_description='"+streamdetails.getDescription()+"',message_count='"+(count-1)+"' where stream_id='"+streamdetails.getStreamId()+"';";
			System.out.println("update stream"+cmd);
			statement.executeUpdate(cmd);
		
			
			
			flag=1;
						
		System.out.println("insertmessage cmd_mess"+cmd_mess);
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	public int deleltemessageid(List<String> sample)
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
		try
		{
						 
			String cmd_mess="";
			System.out.println("insert sample"+sample);
			int count=1;
			for(String message :sample)
			{		
			System.out.println(message);	
			cmd_mess="delete from message_stream where message_id='"+message+"'";
			count++;
			statement.execute(cmd_mess);
			}
			flag=1;
			System.out.println("deletemessage cmd_mess"+cmd_mess);
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	
	
	
	public List<StreamDetails> getStream(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
	    try{
	       
	    	if(userName.equals("superadmin"))
	       cmd="select * from stream";
	    	else
	    		cmd="select * from stream where created_by='"+userName+"'";
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			while(resultSet.next()){
				stream.add(new StreamDetails(resultSet.getString("stream_id"),
						resultSet.getString("admin_name")
						,resultSet.getString("stream_name")	,
						resultSet.getString("textingcontacts"),
						resultSet.getString("stream_description"),resultSet.getString("message_count"),resultSet.getString("created_by")
						));
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
	    return stream;
		
	}
	
	public List<StreamDetails> getStream(String stream_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
	    try{
	        if(userName.equals("superadmin"))
	       cmd="select * from stream";
	        else
	        	cmd="select * from stream where stream_id='"+stream_id+"' and created_by='"+userName+"'";
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			while(resultSet.next()){
				stream.add(new StreamDetails(resultSet.getString("stream_id"),resultSet.getString("admin_name")
						,resultSet.getString("stream_name")	,
						resultSet.getString("textingcontacts"),
						resultSet.getString("stream_description"),resultSet.getString("message_count"),resultSet.getString("created_by")
						));
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
	    return stream;
		
	}
	public List<String> getMessages(String stream_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> strlist = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+stream_id+"'";
	    
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("stream_message"));
				i++;
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
	    return strlist;
		
	}
	public List<String> getMessage(List<String> messageid){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> strlist = new ArrayList<String>();
		List<String> strlist1 = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+messageid+"'";
	    
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("stream_message"));
			    i++;
			}
			System.out.println("strlist"+strlist);
			
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
	    return strlist;
	 	
	}
	public List<String> getMessageid(String stream_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> strlist = new ArrayList<String>();
		List<String> strlist1 = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+stream_id+"'";
	    
	    	System.out.println(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("message_id"));
			    i++;
			}
			System.out.println("strlist"+strlist);
			
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
	    return strlist;
	   
		
	}		
	public int deletestream(String stream_id,String admin){
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
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 String cmd_getstreamname="select stream_name from stream where stream_id='"+stream_id+"'";
				String Desc="Delete stream ";		
			
			resultSet=statement.executeQuery(cmd_getstreamname);
			
			if(resultSet.next())
				Desc=Desc+resultSet.getString(1);
			statement.execute("delete from stream where stream_id='"+stream_id+"'");
			statement.execute("delete from message_stream where stream_id='"+stream_id+"'");
			
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
