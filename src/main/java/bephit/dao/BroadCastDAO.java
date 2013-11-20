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

import bephit.model.AdminUser;
import bephit.model.BroadCastReports;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import bephit.model.BroadCast;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

public class BroadCastDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String getMaxBroadCastID() {
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
		String brid = "10000";
		try {
			resultSet = statement
					.executeQuery("select Max(broad_id) as max_id from broad_cast_table");
			int br_id = 0;
			if (resultSet.next()) {

				br_id = Integer.parseInt(resultSet.getString("max_id"));
				System.out.println(br_id);
				br_id = br_id + 1;
				brid = Integer.toString(br_id);
				System.out.println(brid);
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
		return brid;

	}

	public int insertNewBroadCast(BroadCast broadCast) {
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
//			DateFormat dateFormat=new SimpleDateFormat();

			String cmd = "INSERT INTO broad_cast_table(broad_id,stream_id,group_id,frequency,start_date,fstream_time,sstream_time,stream_week_day,status) values('"
					+ broadCast.getBroad_id()
					+ "','"
					+ broadCast.getStream_id()
					+ "','"
					+ broadCast.getGroup_id()
					+ "','"
					+ broadCast.getFrequency()
					+ "','"
					+ broadCast.getStart_date()
					+ "','"
					+ broadCast.getFstream_time()
					+ "','"
					+ broadCast.getSstream_time()
					+ "','"
					+ broadCast.getStream_week_day() + "','0')";
			System.out.println(cmd);
			statement.execute(cmd);
			flag = 1;
		} catch (Exception ex) {
			System.out.println(ex.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
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

	public List<BroadCastReports> getReports() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String repotscmd;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BroadCastReports> reportList = new ArrayList<BroadCastReports>();
		try {

			repotscmd = "select b.broad_id,str.stream_name,pg.group_name,b.frequency,str.message_count,b.start_date,b.status,b.enable from broad_cast_table as b join stream as str on str.stream_id=b.stream_id join participant_group_table as pg on b.group_id=pg.group_id;";
			
			resultSet=statement.executeQuery(repotscmd);
			System.out.println(repotscmd);
			while (resultSet.next()) {
				reportList.add(new BroadCastReports(resultSet
						.getString("broad_id"),resultSet
						.getString("stream_name"),resultSet
						.getString("group_name"), resultSet
						.getString("frequency"), resultSet
						.getString("start_date"),
						resultSet.getString("status"),resultSet
								.getString("message_count"),resultSet.getString("enable")));

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
		System.out.println(reportList);
		return reportList;

	}

	public List<BroadCast> getBroadCast() {
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
		List<BroadCast> bcast = new ArrayList<BroadCast>();
		try {

			cmd = "select * from broad_cast_table";

			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next())
			{
				bcast.add(new BroadCast(resultSet.getString("broad_id"),
						resultSet.getString("stream_id"), resultSet
								.getString("group_id"), resultSet
								.getString("frequency"), resultSet
								.getString("start_date"), resultSet
								.getString("fstream_time"), resultSet
								.getString("sstream_time"), resultSet
								.getString("stream_week_day"), resultSet
								.getString("status")));
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
		return bcast;
	}

	public int setenable_messaging(String broad_id,String enable)
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
			
	String cmd_update_enable="Update broad_cast_table set enable="+enable+" where broad_id='"+broad_id+"'";
	statement.executeUpdate(cmd_update_enable);
	
	System.out.println(cmd_update_enable);
	
	
	
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

}
