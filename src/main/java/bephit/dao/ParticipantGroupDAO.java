package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import bephit.model.ParticipantGroups;

public class ParticipantGroupDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public int setParticipantGroup(ParticipantGroups pgroups) {
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
			int enabled = 1;
			int updateemail = 1;
			int local_age;
			if (Integer.parseInt(pgroups.getgroup_scope()) == 0)
				local_age = 0;
			else
				local_age = Integer.parseInt(pgroups.getlocal_age());
			// System.out.println(dateFormat.format(date));
			// String
			// cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
			String cmd_pgroups = "INSERT INTO `deemsyspro_deem`.`participant_group_table`(`group_name`,`group_scope`,`group_decs`,`select_local_group`,`local_city`,`local_dojfrom`,`local_dojto`,`local_age`,`local_educations`) VALUES('"
					+ pgroups.getgroup_name()
					+ "','"
					+ pgroups.getgroup_scope()
					+ "','"
					+ pgroups.getgroup_decs()
					+ "','"
					+ pgroups.getselect_local_group()
					+ "','"
					+ pgroups.getlocal_city()
					+ "','"
					+ pgroups.getlocal_dojfrom()
					+ "','"
					+ pgroups.getlocal_dojto()
					+ "','"
					+ local_age
					+ "','"
					+ pgroups.getlocal_educations() + "')";
			System.out.println(cmd_pgroups);
			statement.execute(cmd_pgroups);
			flag = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		if (flag == 1)
			return 1;
		else
			return 0;

	}

	public int deleteParticipantgroup(String group_id) {
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
			int enabled = 1;
			int updateemail = 1;
			int local_age;
			/*
			 * if(Integer.parseInt(pgroups.getgroup_scope())==0) local_age=0;
			 * else local_age=Integer.parseInt(pgroups.getlocal_age());
			 */
			// System.out.println(dateFormat.format(date));
			// String
			// cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
			String cmd_pgroups = "delete from participant_group_table where group_id='"
					+ group_id + "'";
			System.out.println(cmd_pgroups);
			statement.execute(cmd_pgroups);
			flag = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		if (flag == 1)
			return 1;
		else
			return 0;
	}

	public List<ParticipantGroups> getGroups() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// List<ParticipantsDetails> participants = new
		// ArrayList<ParticipantsDetails>();
		try {
			int enabled = 1;
			int updateemail = 1;
			String cmd_groupslist = "Select * from `deemsyspro_deem`.`participant_group_table`";
			System.out.println(cmd_groupslist);
			resultSet = statement.executeQuery(cmd_groupslist);
			while (resultSet.next()) {

				participantgroup.add(new ParticipantGroups(resultSet
						.getString("group_id"), resultSet
						.getString("group_name"), resultSet
						.getString("group_scope"), resultSet
						.getString("group_decs"), resultSet
						.getString("select_local_group"), resultSet
						.getString("local_city"), resultSet
						.getString("local_dojfrom"), resultSet
						.getString("local_dojto"), resultSet
						.getString("local_age"), resultSet
						.getString("local_educations")));

			}

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
			// if(flag==1)
			// return 1;
			// else
			// return 0;
		}
		return participantgroup;
	}

	public int checkGroupname(ParticipantGroups pgroups) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			int enabled = 1;
			int updateemail = 1;
			String cmd_groupslist = "Select count(*) as counting from `deemsyspro_deem`.`participant_group_table` where group_name='"
					+ pgroups.getgroup_name() + "'";
			resultSet = statement.executeQuery(cmd_groupslist);
			resultSet.next();
			int count = Integer.parseInt(resultSet.getString("counting"));
			System.out.println(count);
			if (count > 0) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			return 0;
		} finally {
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
	   	
	     String cmd_group="Select group_name from `deemsyspro_deem`.`participant_group_table` where group_id="+group_id;
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
