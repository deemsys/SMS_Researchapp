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

import com.mysql.jdbc.PreparedStatement;

import bephit.model.AdminUser;

public class AdminUserDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public int setAdminUser(AdminUser adminuser)
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
		try
		{
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			 Date date = new Date();		 
			 
			 
	String cmd="INSERT INTO admin_log_table(admin_username,admin_password,admin_email,admin_mobile,admin_address,previlages,date,status,addstream,editstream,deletestream,broadcaststream,addparticipant,editparticipant,deleteparticipant,addadminuser,edituser,deleteuser,modifysettings,mailtemplate) VALUES('"+adminuser.getAdmin_username()+"','"+adminuser.getAdmin_password()+"','"+adminuser.getAdmin_email()+"','"+adminuser.getAdmin_mobile()+"','"+adminuser.getAdmin_address()+"','empty','"+dateFormat.format(date)+"',0,'"+adminuser.getAddstream()+"','"+adminuser.getEditstream()+"','"+adminuser.getDeletestream()+"','"+adminuser.getBroadcaststream()+"','"+adminuser.getAddparticipant()+"','"+adminuser.getEditparticipant()+"','"+adminuser.getDeleteparticipant()+"','"+adminuser.getAddadminuser()+"','"+adminuser.getEdituser()+"','"+adminuser.getDeleteuser()+"','"+adminuser.getModifysettings()+"','"+adminuser.getMailtemplate()+"')";
	System.out.println(cmd);
	statement.execute(cmd);
	
	
	
		}
		catch(Exception ex)
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
		return 1;
	}
	
	
	public List<AdminUser> getAdminUser() {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();

		try
		{
			resultSet = statement.
					executeQuery("select * from admin_log_table");
			while (resultSet.next()) {
				adminuser.add(new AdminUser(resultSet.getString("admin_id"),
						resultSet.getString("admin_username"), resultSet
								.getString("admin_password"), resultSet
								.getString("admin_email"), resultSet
								.getString("admin_mobile"), resultSet
								.getString("admin_address"), resultSet
								.getString("previlages"), resultSet
								.getString("date"), resultSet
								.getString("status"),
								resultSet.getString("addstream"),
								resultSet.getString("editstream"),
								resultSet.getString("deletestream"),
								resultSet.getString("broadcaststream"),
								resultSet.getString("addparticipant"),
								resultSet.getString("editparticipant"),
								resultSet.getString("deleteparticipant"),
								resultSet.getString("addadminuser"),
								resultSet.getString("edituser"),
							    resultSet.getString("deleteuser"),
								resultSet.getString("modifysettings"),
								resultSet.getString("mailtemplate")
								));
			
		                  }
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

		return adminuser;
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
