package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import bephit.model.UserProfile;;

public class UserDAO {
	private DataSource dataSource;
	 
		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}
		
	public int setUser(UserProfile user)
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
	    	 //System.out.println(dateFormat.format(date));
	    	String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
	    	
          // String cmd_roles="INSERT INTO `deemsyspro_deem`.`user_roles`(`USER_ID`,`AUTHORITY`) VALUES();
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
	    	if(flag==1)
	    		return 1;
	    	else
	    		return 0;
	    }
	    
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
