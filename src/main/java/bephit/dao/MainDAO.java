package bephit.dao;

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

import javax.sql.DataSource;

import bephit.model.ParticipantsDetails;

public class MainDAO {
	private DataSource dataSource;

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
	    	String cmd="UPDATE participants_table SET message ='"+participant.getmessage()+"' WHERE participants_id='65'";
	    	
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
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println("providername"+participant.getProvider_name());
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (`fname`,`lname`,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time2`,`time3`,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getFname()
					+ "','"
					+ participant.getLname()
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
					+participant.getProvider_name()
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','0')";
			System.out.println(cmd);
			statement.executeUpdate(cmd);
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
			String cmd = "INSERT INTO `participants_table` (`fname`,`lname`,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time2`,`time3`,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getFname()
					+ "','"
					+ participant.getLname()
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
					+admin_id
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','0')";
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


	public int updateParticipants(ParticipantsDetails participant,String participants_id,String admin)
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
	    	String cmd="UPDATE participants_table SET fname ='"+participant.getFname()+"',lname ='"+participant.getLname()+"',mobile_num ='"+participant.getMobile_num()+"',gender ='"+participant.getGender()+"'  ,city ='"+participant.getCity()+"' ,education = '"+participant.getEducation()+"',medical_details = '"+participant.getMedical_details()+"',time1='"+participant.getTime1()+"',time2='"+participant.getTime2()+"',time3='"+participant.getTime3()+"',Provider_name='"+participant.getProvider_name()+"',group_name = '"+participant.getGroup_name()+"',age = '"+participant.getAge()+"',date_of_join = '"+dateFormat.format(date)+"',email_id = '"+participant.getEmail_id()+"' WHERE participants_id='"+participants_id+"';";
	    	String Desc="Update participant "+participant.getFname();
	    	
	    	
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
	    	    	
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
	
	public List<ParticipantsDetails> getParticipants() {
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
			resultSet = statement
					.executeQuery("select * from participants_table");
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"), resultSet.getString("lname"),
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

	public List<ParticipantsDetails> getlimitedParticipants(int page) {
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

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;

			cmd = "select * from participants_table limit " + offset + ","
					+ limit;
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"), resultSet.getString("lname"),
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

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {

			String cmd;
			cmd = "select count(*) as noofrecords from participants_table";
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
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd = "select * from participants_table where mobile_num='"
					+ mobile + "' or group_name='" + groupname + "' or city='"
					+ city + "'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet
						.getString("fname"), resultSet.getString("lname"),
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
						.getString("fname"), resultSet.getString("lname"),
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
						.getString("fname"), resultSet.getString("lname"),
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
						.getString("fname"), resultSet.getString("lname"),
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

}
