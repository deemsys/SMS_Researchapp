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

import bephit.model.ParticipantAnswers;
import bephit.model.Response;;

public class ParticipantAnswersDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<ParticipantAnswers> getResponse(String response_id) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantAnswers> answers = new ArrayList<ParticipantAnswers>();

		try
		{
			resultSet = statement.
					executeQuery("select * from weekly_answers where log_id='"+response_id+"'");
			System.out.println("select * from weekly_logs");
			while (resultSet.next()) {
				
						answers.add(new ParticipantAnswers(resultSet.getString("id"),resultSet.getString("log_id"), resultSet.getString("question1"),resultSet.getString("answer1"),resultSet.getString("question2"), resultSet.getString("answer2"), resultSet.getString("question3"),resultSet.getString("answer3"),resultSet.getString("attend_date"),resultSet.getString("status")));
			
		                  }
			System.out.println(answers);
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

		return answers;
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