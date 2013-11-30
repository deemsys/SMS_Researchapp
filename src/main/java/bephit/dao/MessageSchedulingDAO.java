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
import java.util.TimeZone;

import javax.sql.DataSource;

import bephit.model.ParticipantGroups;
import bephit.model.ParticipantsDetails;
import bephit.model.TwilioSMS;
import bephit.model.UserProfile;
import bephit.model.MessageList;

import org.apache.tomcat.jni.Local;
import org.joda.time.DateTime;
import org.joda.time.DateTimeComparator;
import org.joda.time.DateTimeZone;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.LocalDate;
import org.joda.time.ReadableInstant;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageSchedulingDAO {
	private DataSource dataSource;
	
	
	@Autowired
	TwilioSMS messageSender;
	
	@Autowired
	MessageStatusDAO messageStatus;

	protected static Logger logger = org.slf4j.LoggerFactory.getLogger(MessageSchedulingDAO.class);
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<String> getMessagesToSend() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<String> groups = new ArrayList<String>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "Select * from participant_group_table";
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				groups.add(resultSet.getString("group_name"));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return groups;

	}
	

	public List<String> getBroadcast_enabled_ids() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<String> broadcastids = new ArrayList<String>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "Select * from broad_cast_table where enable=1 and start_date<=DATE_FORMAT(curdate(),'%m/%d/%Y')";
			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				broadcastids.add(resultSet.getString("broad_id"));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return broadcastids;//deemsyspro_deem

	}

	public List<MessageList> getMessageDetails() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<MessageList> message_details = new ArrayList<MessageList>();
		List<String> broad_enabled_ids = new ArrayList<String>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println("Collecting enabled overall  Message list...");

			// Get the broadcast which are enabled
			broad_enabled_ids = this.getBroadcast_enabled_ids();

			// Get the details of selected broadcast list
			for (String broad_id : broad_enabled_ids) {
				cmd = "select b.broad_id,b.stream_id,b.group_id,b.days_weeks,b.frequency,b.start_date,b.fstream_time,b.sstream_time,b.tstream_time,b.fstream_time_am_pm,b.sstream_time_am_pm,b.tstream_time_am_pm,b.stream_week_day,pg.participant_id,p.username,p.mobile_num,p.time1,p.time2,p.time3,s.message_count as no_of_messages,s.textingcontacts,DATE_FORMAT(curdate(),'%m/%d/%Y') as " +
						"_date from broad_cast_table as b join participant_group as pg join participants_table as p join stream as s on b.group_id=pg.group_id and p.participants_id= pg.participant_id  and p.message=1 and s.stream_id=b.stream_id where b.start_date<=DATE_FORMAT(curdate(),'%m/%d/%Y') and broad_id='"
						+ broad_id + "'";
				resultSet = statement.executeQuery(cmd);
				while (resultSet.next()) {
					message_details.add(new MessageList(resultSet
							.getString("broad_id"), resultSet
							.getString("stream_id"), resultSet
							.getString("group_id"), resultSet
							.getString("frequency"), resultSet
							.getString("start_date"), resultSet
							.getString("fstream_time"), resultSet
							.getString("sstream_time"),resultSet.getString("tstream_time"),
							resultSet.getString("fstream_time_am_pm"),
							resultSet.getString("sstream_time_am_pm"),							
							resultSet.getString("tstream_time_am_pm"),resultSet							
							.getString("stream_week_day"), resultSet
							.getString("participant_id"), resultSet
							.getString("username"), resultSet
							.getString("mobile_num"), resultSet
							.getString("time1"), resultSet.getString("time2"),
							resultSet.getString("time3"), resultSet
									.getString("no_of_messages"), resultSet
									.getString("textingcontacts"),resultSet.getString("days_weeks")));
				}
				resultSet = null;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return message_details;

	}

	public List<MessageList> Tosend_message() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<MessageList> message_details = new ArrayList<MessageList>();
		List<MessageList> one_per_day_messages = new ArrayList<MessageList>();
		List<MessageList> two_per_day_messages = new ArrayList<MessageList>();
		List<MessageList> weekly_messages = new ArrayList<MessageList>();
        List<MessageList> three_per_day_messages=new ArrayList<MessageList>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println(cmd);


			// Get the whole Message details which are enabled
   		message_details = this.getMessageDetails();

   		System.out.println("Start Spliting into four messages....");
			// Filter the messages based on their frequency
			for (int i = 0; i < message_details.size(); i++) {
				switch (Integer.parseInt(message_details.get(i).getFrequency())) {
				case 0:// store in one per frequency list
					one_per_day_messages.add(message_details.get(i));
					break;
				case 1:// store in two per frequency list
					two_per_day_messages.add(message_details.get(i));
					break;
				case 2:// store in weekly list
					weekly_messages.add(message_details.get(i));
					break;
				case 3:// store in three per day frequency list
					three_per_day_messages.add(message_details.get(i));
					break;
				default:
					break;
				}
			}
			System.out.println("End Spliting");
			// First process one per day
			System.out.println("Start processing one per day frequency");		
			process_oneperday_messages(one_per_day_messages);
			System.out.println("processing two per day frequency");	
			// Process two per day
	        process_twoperday_messages(two_per_day_messages);
			
			
			System.out.println("Processing three per day frequency");
			process_threeperday_messages(three_per_day_messages);
			
			
			System.out.println("processing week per day frequency");
	     	process_weekly_once_messages(weekly_messages);
			// Weekly messages

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return message_details;

	}

	//Function to process one per day messages
	public List<MessageList> process_oneperday_messages(
			List<MessageList> message_list) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// Date operations
        
		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		
		//
		//--------------------------Time Zone-----------------------------//
        DateTimeZone TZ=DateTimeZone.forID("EST");
		DateTime today_date = new DateTime(TZ);
		System.out.println("Today Date:"+today_date);
		//------------------------End Time Zone-------------------------//
	
		DateTime send_date = new DateTime();
		DateTimeComparator comparing_date = DateTimeComparator
				.getDateOnlyInstance();

		// End Date Operation

		//boolean yes = today_date.isAfter(send_date);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println(cmd);

			// Query to fetch which message is to send to the particular
			// participants
			String participant_message_no = "";
			int last_message_no, current_message_no = 0, no_of_days;
			int message_count, textingcontacts,days_weeks;
			String Message_to_send;
			boolean has_message = false;
			System.out.println("Going to process one per day frequency....");
			
			for (int i = 0; i < message_list.size(); i++) {
				System.out.println("Collect information from log...");
				participant_message_no = "select * from participant_message_log where broad_id='"
						+ message_list.get(i).getBroad_id()
						+ "' and Participant_id='"
						+ message_list.get(i).getParticipant_id() + "'";
				resultSet = statement.executeQuery(participant_message_no);
				System.out.println("Provider Id: "+message_list.get(i).getParticipant_id());
			//	preferred_time(message_list.get(i).getProvider_second_message_time(), message_list.get(i).getTime1(), message_list.get(i).getTime2(), message_list.get(i).getTime3());
					
				if (resultSet.next()) {
					send_date = formatter.parseDateTime(resultSet
							.getString("dateofsend"));
					System.out.println(today_date.toLocalDate());
					System.out.println(send_date.toLocalDate());
					
					LocalDate today=today_date.toLocalDate();
					LocalDate last_send=send_date.toLocalDate();
					//Compare the dates and and store the value for further calcculations
					//int date_compare =comparing_date.compare(today_date, send_date);
					int date_compare=today.compareTo(last_send);
					
					
					System.out.println("date_compare:"+date_compare);

					if (Integer.parseInt(resultSet.getString("flag_status")) == 0
							|| (Integer.parseInt(resultSet
									.getString("flag_status")) == 1 && (date_compare > 0))) {
						
						last_message_no = Integer.parseInt(resultSet
								.getString("no_of_message_send"));
						days_weeks=Integer.parseInt(message_list.get(i).getDays_weeks());
						no_of_days = Integer.parseInt(resultSet
								.getString("no_of_days"));
						textingcontacts = Integer.parseInt(message_list.get(i)
								.getTextingcontacts());
						message_count = Integer.parseInt(message_list.get(i)
								.getMessage_count());

						// Calculate the current message number using
						// no_of_message_send and texting contacts
						if (last_message_no == 0) {
							current_message_no = 1;
							no_of_days = 1;
							has_message = true;
						} else {
							if (no_of_days + 1 < days_weeks) {
								current_message_no = (last_message_no % message_count) + 1;
								no_of_days++;
								has_message = true;

							} else {
								has_message = false;
							}

						}

						// Check to send message
						if (has_message)
						{
							System.out.println("One message found to send");
							System.out.println(preferred_time(message_list.get(i).getProvider_first_message_time().substring(0,2)+' '+message_list.get(i).getProvider_first_am_pm().substring(0,2), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)));
							System.out.println(Hours.hours(today_date.getHourOfDay()));
						 if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(0,2)+' '+message_list.get(i).getProvider_first_am_pm().substring(0,2), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
							{
							 logger.info("Message send to" +message_list.get(i).getParticipant_id()+"whose preffered time is now!!!");
								Message_to_send = this.getMesssage(message_list
									.get(i).getStream_id(), current_message_no);
							System.out.println(Message_to_send);
							System.out.println(message_list.get(i)
									.getStream_id());
							// Call update query to update participant message
							// sending status
							 try{
						    	 System.out.println("Sending messages.......");
							      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
							      	logger.info("One per day sending message..."+message_list.get(i).getParticipant_id());
							     }catch(Exception e){e.printStackTrace();}				
							
							
							 System.out.println("Updating Participant log table....");   	
							update_participant_message_status(
									message_list.get(i).getBroad_id(),
									message_list.get(i).getParticipant_id(),
									current_message_no, no_of_days, 1);
							
							System.out.println("Insert the data into message status table.....");
							 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
								
					       // send message
							// message_list.get(i).getMobile_num(),
						
							// Message_to_send;
							
							    
							
							
							}

						}
					} else
						continue;
				} else
					continue;

			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		System.out.println("End one per day frequency....");
		return message_list;

	}

	
	//Function to process weekly once messages
	public List<MessageList> process_weekly_once_messages(
			List<MessageList> message_list) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// Date operations

		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		
		//--------------------------Time Zone-----------------------------//
        DateTimeZone TZ=DateTimeZone.forID("EST");
		DateTime today_date = new DateTime(TZ);
		System.out.println("Today Date:"+today_date);
		//------------------------End Time Zone-------------------------//
	
		DateTime send_date = new DateTime();
	
		// End Date Operation

		boolean yes = today_date.isAfter(send_date);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println(cmd);

			// Query to fetch which message is to send to the particular
			// participants deemsyspro_deem.Participant_message_log
			String participant_message_no = "";
			int last_message_no, current_message_no = 0, no_of_days;
			int message_count, textingcontacts,days_weeks;
			String Message_to_send;
			boolean has_message = false;
			for (int i = 0; i < message_list.size(); i++) {
				System.out.println("Collect info from log....");
				participant_message_no = "select * from participant_message_log where broad_id='"
						+ message_list.get(i).getBroad_id()
						+ "' and Participant_id='"
						+ message_list.get(i).getParticipant_id() + "'";
				resultSet = statement.executeQuery(participant_message_no);
				if (resultSet.next()) {
					send_date = formatter.parseDateTime(resultSet
							.getString("dateofsend"));
					System.out.println(today_date);
					System.out.println(send_date);
					//Days compare
					int days = Days.daysBetween(send_date,today_date).getDays()-1;
					System.out.println("Days between:"+days);
                   //Days Compare end

					if (Integer.parseInt(resultSet.getString("flag_status")) == 0||(days==7) ){
						last_message_no = Integer.parseInt(resultSet
								.getString("no_of_message_send"));
						days_weeks=Integer.parseInt(message_list.get(i).getDays_weeks());
						no_of_days = Integer.parseInt(resultSet
								.getString("no_of_days"));
						textingcontacts = Integer.parseInt(message_list.get(i)
								.getTextingcontacts());
						message_count = Integer.parseInt(message_list.get(i)
								.getMessage_count());

						// Calculate the current message number using
						// no_of_message_send and texting contacts
						if (last_message_no == 0) {
							current_message_no = 1;
							no_of_days = 1;
							has_message = true;
						} else {
							if (no_of_days + 1 < days_weeks) {
								current_message_no = (last_message_no % message_count) + 1;
								no_of_days++;
								has_message = true;

							} else {
								has_message = false;
							}

						}

						// Check to send message
						if (has_message) {
							System.out.println("Message found to display");
							int day=0;
							
							System.out.println(today_date.getDayOfWeek());
							if(today_date.getDayOfWeek()==Integer.parseInt(message_list.get(i).getProvider_week_message_day()))
							{
							if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(6,8),message_list.get(i).getTime1().substring(0,2),message_list.get(i).getTime2().substring(0,2),message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))
							{
						
							logger.info("Message Send to"+message_list.get(i).getParticipant_id());
							Message_to_send = this.getMesssage(message_list
									.get(i).getStream_id(), current_message_no);
							System.out.println(Message_to_send);
							System.out.println(message_list.get(i)
									.getStream_id());
							// Call update query to update participant message
							// sending status
							 try{
						    	 
							      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
							    	logger.info("Weekly sending message..."+message_list.get(i).getParticipant_id());
							     }catch(Exception e){e.printStackTrace();}	
							
							
							update_participant_message_status(
									message_list.get(i).getBroad_id(),
									message_list.get(i).getParticipant_id(),
									current_message_no, no_of_days, 1);
							 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
								
							// send message
							// message_list.get(i).getMobile_num(),
							// Message_to_send;
							}
							}

						}
					} else
						continue;
				} else
					continue;

			}
		} catch (Exception e) {
			System.out.println("Weekly processing error:"+e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return message_list;

	}
	
	
	
	
    //Function to Process two_per_day_messages	
	public List<MessageList> process_twoperday_messages(
			List<MessageList> message_list) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// Date operations

		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		
		//--------------------------Time Zone-----------------------------//
        DateTimeZone TZ=DateTimeZone.forID("EST");
		DateTime today_date = new DateTime(TZ);
		System.out.println("Today Date:"+today_date);
		//------------------------End Time Zone-------------------------//
		
		DateTime send_date = new DateTime(TZ);
		DateTimeComparator comparing_date = DateTimeComparator
				.getDateOnlyInstance();

		// End Date Operation

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println(cmd);

			// Query to fetch which message is to send to the particular
			// participants
			String participant_message_no = "";
			int last_message_no, current_message_no = 0, no_of_days;
			int message_count, textingcontacts,days_weeks;
			String Message_to_send;
			int flag_status=0;
			boolean has_message = false;
			for (int i = 0; i < message_list.size(); i++) {
				System.out.println("Collect info from system....");
				participant_message_no = "select * from participant_message_log where broad_id='"
						+ message_list.get(i).getBroad_id()
						+ "' and Participant_id='"
						+ message_list.get(i).getParticipant_id() + "'";
				resultSet = statement.executeQuery(participant_message_no);
				if (resultSet.next()) {
					send_date = formatter.parseDateTime(resultSet.getString("dateofsend"));
					System.out.println(today_date.toLocalDate());
					System.out.println(send_date);
					System.out.println(send_date.toLocalDate());
					
					LocalDate today=today_date.toLocalDate();
					LocalDate last_send=send_date.toLocalDate();
					//Compare the dates and and store the value for further calcculations
					//int date_compare =comparing_date.compare(today_date, send_date);
					int date_compare=today.compareTo(last_send);				
				//	int date_compare = today_date.toLocalDate().compareTo(send_date.toLocalDate());
					
					flag_status=Integer.parseInt(resultSet.getString("flag_status"));

					if (flag_status==0 || (date_compare==0&&flag_status==1)||flag_status==2&&date_compare>0)
					{
						last_message_no = Integer.parseInt(resultSet
								.getString("no_of_message_send"));
						days_weeks=Integer.parseInt(message_list.get(i).getDays_weeks());
						no_of_days = Integer.parseInt(resultSet
								.getString("no_of_days"));
						textingcontacts = Integer.parseInt(message_list.get(i)
								.getTextingcontacts());
						message_count = Integer.parseInt(message_list.get(i)
								.getMessage_count());

						// Calculate the current message number using
						// no_of_message_send and texting contacts
						if (last_message_no == 0) {
							current_message_no = 1;
							no_of_days = 1;
							has_message = true;
						} else {
							if (no_of_days + 1 < days_weeks) {
								current_message_no = (last_message_no % message_count) + 1;
								//no_of_days++;
								has_message = true;

							} else {
								has_message = false;
							}

						}

						// Check to send message
						if (has_message) {
							System.out.println("Found one message to send....");
							Message_to_send = this.getMesssage(message_list
									.get(i).getStream_id(), current_message_no);
							System.out.println(Message_to_send);
							System.out.println(message_list.get(i)
									.getStream_id());
							// Call update query to update participant message
							// sending status
							if(flag_status==0)
							{
								System.out.println(preferred_time(message_list.get(i).getProvider_first_message_time().substring(3,5)+' '+message_list.get(i).getProvider_first_am_pm().substring(3,5), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)));
								System.out.println(Hours.hours(today_date.getHourOfDay()));
								 if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(3,5)+' '+message_list.get(i).getProvider_first_am_pm().substring(3,5), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
								           messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
								       	logger.info("Two per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
							update_participant_message_status(
									message_list.get(i).getBroad_id(),
									message_list.get(i).getParticipant_id(),
									current_message_no,1, 1);
							 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
								
								 }
							}
							else if(date_compare==0&&flag_status==1)
							{
								System.out.println(Hours.hours(today_date.getHourOfDay()));
								System.out.println(preferred_time(message_list.get(i).getProvider_second_message_time().substring(0,2)+' '+message_list.get(i).getProvider_second_am_pm().substring(0,2), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)));
								 if(preferred_time(message_list.get(i).getProvider_second_message_time().substring(0,2)+' '+message_list.get(i).getProvider_second_am_pm().substring(0,2), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
								    	 
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									      	logger.info("Two per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
								update_participant_message_status(
										message_list.get(i).getBroad_id(),
										message_list.get(i).getParticipant_id(),
										current_message_no, no_of_days, 2);
								 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
									
								 }
							}
							else if(date_compare>0&&flag_status==2)
							{
								 if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(3,5)+' '+message_list.get(i).getProvider_first_am_pm().substring(3,5), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
								    	 
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									    	logger.info("Two per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
								update_participant_message_status(
										message_list.get(i).getBroad_id(),
										message_list.get(i).getParticipant_id(),
										current_message_no, no_of_days+1, 1);
								 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
									
								 }
							}
							}
					} else
						continue;
				} else
					continue;

			}
		} catch (Exception e) {
			System.out.println("Two per day processing:"+e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return message_list;

	}

	
	//Function to Process two_per_day_messages	
	public List<MessageList> process_threeperday_messages(
			List<MessageList> message_list) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// Date operations

		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		
		//--------------------------Time Zone-----------------------------//
        DateTimeZone TZ=DateTimeZone.forID("EST");
		DateTime today_date = new DateTime(TZ);
		System.out.println("Today Date:"+today_date);
		//------------------------End Time Zone-------------------------//
		
		DateTime send_date = new DateTime(TZ);
		DateTimeComparator comparing_date = DateTimeComparator
				.getDateOnlyInstance();

		// End Date Operation

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "";
			System.out.println(cmd);

			// Query to fetch which message is to send to the particular
			// participants
			String participant_message_no = "";
			int last_message_no, current_message_no = 0, no_of_days;
			int message_count, textingcontacts,days_weeks;
			String Message_to_send;
			int flag_status=0;
			boolean has_message = false;
			for (int i = 0; i < message_list.size(); i++) {
				System.out.println("Collect info from participant log...");
				participant_message_no = "select * from participant_message_log where broad_id='"
						+ message_list.get(i).getBroad_id()
						+ "' and Participant_id='"
						+ message_list.get(i).getParticipant_id() + "'";
				resultSet = statement.executeQuery(participant_message_no);
				if (resultSet.next()) {
					send_date = formatter.parseDateTime(resultSet
							.getString("dateofsend"));
					System.out.println(today_date.toLocalDate());
					System.out.println(send_date);
					System.out.println(send_date.toLocalDate());
					
					
					LocalDate today=today_date.toLocalDate();
					LocalDate last_send=send_date.toLocalDate();
					
					
					int date_compare = today.compareTo(last_send);
					
					flag_status=Integer.parseInt(resultSet.getString("flag_status"));
					System.out.println("Three per day flag status:"+flag_status);
					System.out.println("Date compare:"+date_compare);

					if (flag_status==0 || (date_compare==0&&flag_status==1)||flag_status==2&&date_compare==0||flag_status==3&&date_compare>0)
					{
						last_message_no = Integer.parseInt(resultSet
								.getString("no_of_message_send"));
						days_weeks=Integer.parseInt(message_list.get(i).getDays_weeks());
						no_of_days = Integer.parseInt(resultSet
								.getString("no_of_days"));
						textingcontacts = Integer.parseInt(message_list.get(i)
								.getTextingcontacts());
						message_count = Integer.parseInt(message_list.get(i)
								.getMessage_count());

						// Calculate the current message number using
						// no_of_message_send and texting contacts
						if (last_message_no == 0) {
							current_message_no = 1;
							no_of_days = 1;
							has_message = true;
						} else {
							if (no_of_days + 1 < days_weeks) {
								current_message_no = (last_message_no % message_count) + 1;
								//no_of_days++;
								has_message = true;

							} else {
								has_message = false;
							}

						}

						// Check to send message
						if (has_message) {
							System.out.println("Message found to send...");
							Message_to_send = this.getMesssage(message_list
									.get(i).getStream_id(), current_message_no);
							System.out.println(Message_to_send);
							System.out.println(message_list.get(i)
									.getStream_id());
							// Call update query to update participant message
							//--------- sending status
							if(flag_status==0)
							{
								System.out.println(preferred_time(message_list.get(i).getProvider_first_message_time().substring(6,8)+' '+message_list.get(i).getProvider_first_am_pm().substring(6,8), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)));
								System.out.println(Hours.hours(today_date.getHourOfDay()));
								 if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(6,8)+' '+message_list.get(i).getProvider_first_am_pm().substring(6,8), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
								    	 System.out.println("Sending message.....!!!!");
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									      	logger.info("Three per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
							update_participant_message_status(
									message_list.get(i).getBroad_id(),
									message_list.get(i).getParticipant_id(),
									current_message_no,1, 1);
							 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
								
								 }
							}
							else if(date_compare==0&&flag_status==1)
							{
								 if(preferred_time(message_list.get(i).getProvider_second_message_time().substring(3,5)+' '+message_list.get(i).getProvider_second_am_pm().substring(3,5), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
										 System.out.println("Sending message.....!!!!");
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									    	logger.info("Three per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
								update_participant_message_status(
										message_list.get(i).getBroad_id(),
										message_list.get(i).getParticipant_id(),
										current_message_no, no_of_days, 2);
								 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
									
								 }
							}
							else if(date_compare==0&&flag_status==2)
							{
								 if(preferred_time(message_list.get(i).getProvider_third_message_time().substring(0,2)+' '+message_list.get(i).getProvider_third_am_pm().substring(0,2), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
										 System.out.println("Sending message.....!!!!");
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									    	logger.info("Three per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
								update_participant_message_status(
										message_list.get(i).getBroad_id(),
										message_list.get(i).getParticipant_id(),
										current_message_no, no_of_days, 3);
								 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
									
								 }
							}
							else if(date_compare>0&&flag_status==3)
							{
								 if(preferred_time(message_list.get(i).getProvider_first_message_time().substring(6,8)+' '+message_list.get(i).getProvider_first_am_pm().substring(6,8), message_list.get(i).getTime1().substring(0,2), message_list.get(i).getTime2().substring(0,2), message_list.get(i).getTime3().substring(0,2)).equals(Hours.hours(today_date.getHourOfDay())))					
								 {
									 try{
										 System.out.println("Sending message.....!!!!");
									      	messageSender.sendSMS(message_list.get(i).getMobile_num(),Message_to_send);
									    	logger.info("Three per day sending message..."+message_list.get(i).getParticipant_id());
									     }catch(Exception e){e.printStackTrace();}	
								update_participant_message_status(
										message_list.get(i).getBroad_id(),
										message_list.get(i).getParticipant_id(),
										current_message_no, no_of_days+1, 1);
								 messageStatus.setMessageStatusDetails(message_list.get(i).getParticipant_id(),message_list.get(i).getBroad_id(), message_list.get(i).getStream_id(),String.valueOf(current_message_no),"Send");
									
								 }
							}
							}
					} else
						continue;
				} else
					continue;

			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return message_list;

	}
	
	
    //To find preferred time
	public Hours preferred_time(String Provider_time,String Time1,String Time2,String Time3)
	{
		//If three times are null then go with provider time
	            System.out.println("Finding preffered time.....");
	        	System.out.println("sending time---------------"+Provider_time);
		        SimpleDateFormat displayFormat = new SimpleDateFormat("HH");
		        SimpleDateFormat parseFormat = new SimpleDateFormat("hh a");
		        Date date=new Date();
				try {
					date = parseFormat.parse(Provider_time);
					System.out.println(parseFormat.format(date) + " converted time = " + displayFormat.format(date));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
		Provider_time=displayFormat.format(date);
		System.out.println();
		Hours Provider_Htime=Hours.hours(Integer.parseInt(displayFormat.format(date)));
		Hours Preferred_time=Provider_Htime;
		if(Time1.equals("nu")&&Time2.equals("nu")&&Time3.equals("nu"))
		{
			return Provider_Htime;
		}
		    else
		    {
		    if(Time1.equals("nu")&&Time2.equals("nu")&&Time3.equals("nu"))
				Preferred_time=one_to_one_time(Provider_time, Time1);
			else
			if(Time1.equals("nu")&&!Time2.equals("nu")&&Time3.equals("nu"))
				Preferred_time=one_to_one_time(Provider_time, Time2);
			else
			if(Time1.equals("nu")&&Time2.equals("nu")&&!Time3.equals("nu"))
				Preferred_time=one_to_one_time(Provider_time, Time3);
			else if(!Time1.equals("nu")&&!Time2.equals("nu")&&Time3.equals("nu"))
				Preferred_time=one_to_two_time(Provider_time, Time1, Time2);
			else if(!Time1.equals("nu")&&Time2.equals("nu")&&!Time3.equals("nu"))
				Preferred_time=one_to_two_time(Provider_time, Time1, Time3);
			else if(Time1.equals("nu")&&!Time2.equals("nu")&&!Time3.equals("nu"))
				Preferred_time=one_to_two_time(Provider_time, Time2, Time3);
			else  if(!Time1.equals("nu")&&!Time2.equals("nu")&&!Time3.equals("nu"))
				Preferred_time=one_to_three_time(Provider_time, Time1, Time2,Time3);
			
		    }
		System.out.println("Preferred time found.....");
		return Preferred_time;
		
	  
		
	}
	
	//Function to calculate preferred time if user gave one times
		public Hours one_to_one_time(String Provider_time,String Time)
		{
			Hours Provider_Htime=Hours.hours(Integer.parseInt(Provider_time));
			Hours Htime1=Hours.hours(Integer.parseInt(Time.substring(0,2)));
			/*if(Provider_Htime.isGreaterThan(Htime1))
			{
			      return Htime1;
			}
			else*/
				return Htime1;
			
		  
		}
		
		//Function to calculate preferred time if user gave two times
		public Hours one_to_two_time(String Provider_time,String Time1,String Time2)
		{
			Hours Provider_Htime=Hours.hours(Integer.parseInt(Provider_time));
			Hours Htime1=Hours.hours(Integer.parseInt(Time1.substring(0,2)));
			Hours Htime2=Hours.hours(Integer.parseInt(Time2.substring(0,2)));
			
			
			if(Provider_Htime.isGreaterThan(Htime1)&&Provider_Htime.isGreaterThan(Htime2))
			{
				if(Htime1.isGreaterThan(Htime2))
					return Htime1;
				else
			    	return Htime2;
			}
			else
			if(Provider_Htime.isLessThan(Htime1)&&Provider_Htime.isLessThan(Htime2))
			{
				if(Htime1.isLessThan(Htime2))
					return Htime1;
				else
					return Htime2;
			}
			else
		    if(Provider_Htime.isGreaterThan(Htime1))
		    	return Htime1;
		    else
		    	return Htime2;
				
			
			/*if(Provider_Htime.equals(Htime1)||((Provider_Htime.isGreaterThan(Htime1))&&(Htime1.isGreaterThan(Htime2))))
			{
				return Htime1;
			}
			else			
			if(Htime2.isGreaterThan(Provider_Htime))
			{
			      return Provider_Htime;
			}
			else
				return Htime2;*/
			
			
			
			
		  
		}
		
		//Function to calculate preferred time if user gave three times
		public Hours one_to_three_time(String Provider_time,String Time1,String Time2,String Time3)
		{
			int t1,t2,t3;
			Hours Provider_Htime=Hours.hours(Integer.parseInt(Provider_time));
			Hours Htime1=Hours.hours(Integer.parseInt(Time1.substring(0,2)));
			Hours Htime2=Hours.hours(Integer.parseInt(Time2.substring(0,2)));
			Hours Htime3=Hours.hours(Integer.parseInt(Time3.substring(0,2)));			
			
			if(Provider_Htime.isLessThan(Htime1)&&Provider_Htime.isLessThan(Htime2)&&Provider_Htime.isLessThan(Htime3))
			{
				if(Htime1.isLessThan(Htime2))
				{
					if(Htime1.isLessThan(Htime3))
						return Htime1;
					else
						return Htime3;
				}
				else
					if(Htime2.isLessThan(Htime3))
						return Htime2;
					else
						return Htime3;
			}
			
			
			else if(Provider_Htime.equals(Htime1)||Provider_Htime.equals(Htime2)||Provider_Htime.equals(Htime3))
				return Provider_Htime;
			else 
		     if((Provider_Htime.isGreaterThan(Htime3))&&(Provider_Htime.isGreaterThan(Htime2))&&(Provider_Htime.isGreaterThan(Htime1)))
			{
				if(Htime1.isGreaterThan(Htime2))
				{
					if(Htime1.isGreaterThan(Htime3))
						return Htime1;
					else
						return Htime3;
				}
				else if(Htime2.isGreaterThan(Htime3))
					return Htime2;
				else
					return Htime3;
			}
			else
			{
			    t1=Provider_Htime.minus(Htime1).getHours();
			    t2=Provider_Htime.minus(Htime2).getHours();
			    t3=Provider_Htime.minus(Htime3).getHours();
			    if(t1<0&&t2<0)
			       	return Htime3;
			    else if(t1<0&&t3<0)
			    	return Htime2;
			    else if(t2<0&&t3<0)
			    	return Htime1;
			    else 
			    if(t1<0)
			    {
			    	if(t2>t3)
			    		return Htime3;
			    	else
			    		return Htime2;
			    }	
			    else if(t2<0)
			    {
			    	if(t1>t3)
			    		return Htime3;
			    	else
			    		return Htime1;
			    	
			    }
			    else if(t3<0)
			    {
			    	if(t1>t2)
			    		return Htime2;
			    	else
			    		return Htime1;
			    }
			    else
			    	return Htime1;
			    
				
			}	
			
			//return Provider_Htime;	
			
			
		  
		}
			
	
	//Function to update participant log 
	public String update_participant_message_status(String broad_id,
			String Participant_id, int current_mes_count, int no_of_days,
			int flag) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Message = "";
		
		TimeZone zone=TimeZone.getTimeZone("EST");
		DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		dateFormat.setTimeZone(zone);
		Date today_date=new Date();
		
		
		
		// System.out.println(dateFormat.getCalendar().DATE);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			System.out.println("Updating Participant log....");
			String cmd = "update participant_message_log set no_of_message_send='"
					+ current_mes_count
					+ "',no_of_days='"
					+ no_of_days
					+ "',flag_status='"
					+ flag
					+ "',dateofsend='"
					+ dateFormat.format(today_date)
					+ "' where Participant_id='"
					+ Participant_id + "' and broad_id='" + broad_id + "'";
			System.out.println(cmd);
			statement.executeUpdate(cmd);

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return Message;
	}

	//Function used to get the message string to send
	public String getMesssage(String Stream_id, int Message_number) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Message = "";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "Select * from message_stream where stream_id='"
					+ Stream_id + "' and msg_count='" + Message_number + "'";

			System.out.println(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				Message = resultSet.getString("stream_message");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseStatement(statement);
			releaseConnection(con);

		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return Message;
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
