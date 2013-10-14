package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import bephit.forms.TextMsgSettingsForm;
import bephit.model.MailTemplateDetails;
import bephit.model.TextMsgSettings;

public class MailTemplateDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public int insertMailTempplate(MailTemplateDetails mailTemplateDetails) {
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
			String cmd = "insert into mail_template(mail_template_name,mail_subject,from_name,from_mail,replay_mail,smtp_servername,port,username,password,message) values('"
					+ mailTemplateDetails.getMail_template_name()
					+ "','"
					+ mailTemplateDetails.getMail_subject()
					+ "','"
					+ mailTemplateDetails.getFrom_name()
					+ "','"
					+ mailTemplateDetails.getFrom_mail()
					+ "','"
					+ mailTemplateDetails.getReplay_mail()
					+ "','"
					+ mailTemplateDetails.getSmtp_servername()
					+ "','"
					+ mailTemplateDetails.getPort()
					+ "','"
					+ mailTemplateDetails.getUsername()
					+ "','"
					+ mailTemplateDetails.getPassword()
					+ "','"
					+ mailTemplateDetails.getMessage() + "')";
			System.out.println(cmd);
			statement.execute(cmd);
			flag = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
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

	public List<MailTemplateDetails> getTemplates() {
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
		List<MailTemplateDetails> maiList = new ArrayList<MailTemplateDetails>();
		try {
			resultSet = statement.executeQuery("select * from mail_template");
			while (resultSet.next()) {
				maiList.add(new MailTemplateDetails(resultSet
						.getString("mail_template_name"), resultSet
						.getString("mail_subject"), resultSet
						.getString("from_name"), resultSet
						.getString("from_mail"), resultSet
						.getString("replay_mail"), resultSet
						.getString("smtp_servername"), resultSet
						.getString("port"), resultSet.getString("username"),
						resultSet.getString("password"), resultSet
								.getString("message")));
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
		return maiList;
	}
public List<TextMsgSettings> getMsgSettings(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<TextMsgSettings> forms=new ArrayList<TextMsgSettings>();
	try {
		resultSet = statement.executeQuery("select * from text_msg_api order by msg_id desc");
		while(resultSet.next()){
			forms.add(new TextMsgSettings(resultSet.getString("account_sid"),resultSet.getString("auth_token"),resultSet.getString("mob_num")));
		}
		
	} catch (Exception e) {
		releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);
    	}
	finally{
    	releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);	    	
    }
   
	return forms;
}
	
	@Override
public String toString() {
	return "MailTemplateDAO []";
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
