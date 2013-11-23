package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import bephit.model.AdminActivity;

public class AdminActivityDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<AdminActivity> getAdminActivity() {

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
		List<AdminActivity> adminactivity = new ArrayList<AdminActivity>();

		try
		{
			resultSet = statement.
					executeQuery("select * from admin_log_activity_table");
			System.out.println("select * from admin_log_activity_table");
			while (resultSet.next()) {
				adminactivity.add(new AdminActivity(resultSet.getString("log_id")
						,resultSet.getString("admin_id")
						,resultSet.getString("ip_address")
						,resultSet.getString("admin_date_time")
						,resultSet.getString("admin_desc")
						,resultSet.getString("done_by")
						));
			
		                  }
			System.out.println(adminactivity);
		} 
		catch (Exception ex) 
		{
			System.out.println(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
		} 
		finally 
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	
	    	
		}

		return adminactivity;
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
