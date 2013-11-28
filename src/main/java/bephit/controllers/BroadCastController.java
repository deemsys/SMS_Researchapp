package bephit.controllers;

import java.awt.image.SampleModel;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.joda.*;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bephit.dao.BroadCastDAO;
import bephit.dao.MessageLogDAO;
import bephit.dao.MessageStatusDAO;
import bephit.dao.ParticipantGroupDAO;
//import bephit.dao.StreamDetailsDAO;
import bephit.dao.StreamDetailsDAO;
import bephit.forms.AdminUserForm;
import bephit.forms.BroadCastForm;
import bephit.forms.BroadCastReportsForm;
import bephit.forms.MessageStatusForm;
import bephit.forms.ParticipantsGroupForm;
import bephit.forms.StreamDetailsForm;
import bephit.model.BroadCast;
import bephit.model.BroadCastReports;
import bephit.model.MessageLog;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;
import bephit.model.TwilioSMS;
import bephit.model.UserProfile;

@Controller
public class BroadCastController {

	@Autowired
	BroadCastDAO broadDAO;
	
	@Autowired
	MessageLogDAO messageLog;
	
	@Autowired  
	TwilioSMS messageSender;
	
	@Autowired    
	ParticipantGroupDAO partDAO;
	
	@Autowired
	StreamDetailsDAO streamDAO;
	
	@Autowired
	MessageStatusDAO messagestatusDAO;
	
	
	
	@RequestMapping(value = "/broadcast", method = RequestMethod.GET)
	public String sendstream(ModelMap model) {
		String BroadID = broadDAO.getMaxBroadCastID();
		System.out.println(BroadID);
		model.addAttribute("currentbroad", BroadID);
		
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);	
		
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","message");
		return "sendstream";
	}

	@RequestMapping(value = "/message_status", method = RequestMethod.GET)
	public String show_message_status(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") String broad_id,ModelMap model) throws IOException  {
		String BroadID = broadDAO.getMaxBroadCastID();
		System.out.println(BroadID);
		model.addAttribute("currentbroad", BroadID);
		
		MessageStatusForm messageForm=new MessageStatusForm();
		messageForm.setMessagestatus(messagestatusDAO.getMessageStatusDetails(broad_id));
		model.addAttribute("messagestatus",messageForm);
		
		
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","message");
		return "message_status";
	}
	@RequestMapping(value = "/sendstream", method = RequestMethod.POST)
	public String insertsendstream(@ModelAttribute("broadCast") @Valid BroadCast broadCast,BindingResult result,ModelMap model,Principal principal) {
		
        
        if (result.hasErrors())
        {
        	//System.out.println(result.getFieldError("group_id"));
        	String BroadID = broadDAO.getMaxBroadCastID();
    		System.out.println(BroadID);
    		model.addAttribute("currentbroad", BroadID);
    		StreamDetailsForm streamForm = new StreamDetailsForm();
    		streamForm.setStreamDetails(streamDAO.getStream());
    		model.addAttribute("streamForm", streamForm);	
    		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
    		participantGroupForm.setParticipantGroups(partDAO.getGroups());
            model.addAttribute("participantGroupForm", participantGroupForm); 
        	model.addAttribute("menu","message");
    	    return "sendstream";
        }
        else
        	
        {
            System.out.println("insert broad id" +broadCast.getBroad_id());
        	 broadDAO.insertNewBroadCast(broadCast);  
        	 messageLog.updateMessagelog();
        	 model.addAttribute("success", "true");  
        	 
        	 BroadCastReportsForm broadCastReportsForm=new BroadCastReportsForm();
     		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
     		model.addAttribute("broadCastReportsForm",broadCastReportsForm);
     		
        	 BroadCastForm broadCastForm=new BroadCastForm();
     		broadCastForm.setBroadCast(broadDAO.getBroadCast());
     		model.addAttribute("broadCastForm",broadCastForm);
     		
       		StreamDetailsForm streamForm = new StreamDetailsForm();
       		streamForm.setStreamDetails(streamDAO.getStream());
       		model.addAttribute("streamForm", streamForm);
       		
       		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
    		participantGroupForm.setParticipantGroups(partDAO.getGroups());
            model.addAttribute("participantGroupForm", participantGroupForm); 
       		model.addAttribute("menu","message");
        return "viewreports";
        }
	}

	
	@RequestMapping(value="/enable_messaging", method=RequestMethod.GET)
	public void enablemessaging(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") String broad_id,@RequestParam("enable") String enable,ModelMap model) throws IOException 
	{	
		BroadCastReportsForm broadCastReportsForm=new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
		model.addAttribute("broadCastReportsForm",broadCastReportsForm);
       
        model.addAttribute("menu","message");
        System.out.println(request.getRequestURL());
        broadDAO.setenable_messaging(broad_id,enable);        
        response.sendRedirect("viewreports");
	}
	
	
	
	
	
	@RequestMapping(value = "/viewreports", method = RequestMethod.GET)
	public String viewreports(HttpServletRequest request,ModelMap model) {
		
		BroadCastReportsForm broadCastReportsForm=new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
		model.addAttribute("broadCastReportsForm",broadCastReportsForm);
		
		 BroadCastForm broadCastForm=new BroadCastForm();
  		broadCastForm.setBroadCast(broadDAO.getBroadCast());
  		model.addAttribute("broadCastForm",broadCastForm);
		
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
		
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        
	    model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
	     model.addAttribute("noofrows",broadCastReportsForm.getBroadCastReports().size());       
	    broadCastReportsForm.setBroadCastReports(broadDAO.getlimitedbroadcast(1));
			model.addAttribute("noofpages",(int) Math.ceil(broadDAO.getnoofbroadcast() * 1.0 / 5));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("currentpage",1);
		model.addAttribute("menu","message");
		return "viewreports";
	}
	
	@RequestMapping(value="/viewbroadcast_page", method=RequestMethod.GET)
	public String pagesbroadcast(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
		BroadCastReportsForm broadCastReportsForm=new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getlimitedbroadcast(page));
	   	model.addAttribute("noofpages",(int) Math.ceil(broadDAO.getnoofbroadcast() * 1.0 / 5));
	   	model.addAttribute("broadCastReportsForm",broadCastReportsForm);
	   	model.addAttribute("noofrows",broadCastReportsForm.getBroadCastReports().size());   
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","message");
        model.addAttribute("button","viewall");
		return "viewreports";
		
	}	
	
	
	
	@RequestMapping(value="/sendstream_ajax",method=RequestMethod.POST)
	public @ResponseBody String addUser1(HttpSession session,HttpServletRequest request,@ModelAttribute(value="broadcast")BroadCast broad, BindingResult result,ModelMap model ){
      
		System.out.println("caught");
		String sample=request.getParameter("stream_id");
		System.out.println("stream_id"+sample);		
		List<StreamDetails> stream_list = new ArrayList<StreamDetails>(); 
		String returnText="";		
		stream_list=streamDAO.getStream(sample);
			returnText="Contains "+stream_list.get(0).getTextingcontacts()+" messages";
		return returnText;
		
	}
	
	@RequestMapping(value="/sendstream_ajax_week",method=RequestMethod.POST)
	public @ResponseBody String getStartdate(HttpSession session,HttpServletRequest request,@ModelAttribute(value="broadcast")BroadCast broad, BindingResult result,ModelMap model ){
      
	String day=request.getParameter("stream_week_day");
	String date=request.getParameter("start_date");
    String returnText;
	// Date operations

	DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
	
	//--------------------------Time Zone-----------------------------//
    DateTimeZone TZ=DateTimeZone.forID("EST");
	DateTime selected_date = new DateTime(TZ);
	DateTime today_date=new DateTime(TZ);
	selected_date=formatter.parseDateTime(date);
	//------------------------End Time Zone-------------------------//
	
    int diff=((Integer.parseInt(day)-selected_date.getDayOfWeek())+7)%7;
    
    System.out.println("Selected day:"+selected_date.getDayOfWeek());
    System.out.println("Day:"+day);
    System.out.println("Date difference:"+diff);
    
    returnText=selected_date.plusDays(diff).toLocalDate().toString();
	return "Message will start sending on "+returnText;
		
	}
	
	
	@RequestMapping(value="/check_lost",method=RequestMethod.POST)
	public @ResponseBody String check_lost(HttpSession session,HttpServletRequest request,@ModelAttribute(value="broadcast")BroadCast broad, BindingResult result,ModelMap model )
	{
      
		String sample=request.getParameter("stream_id");
		int days_weeks=Integer.parseInt(request.getParameter("no_of_days"));
		int frequency=Integer.parseInt(request.getParameter("frequency"));
		System.out.println("stream_id"+sample);		
		List<StreamDetails> stream_list = new ArrayList<StreamDetails>(); 
		String returnText="";		
		stream_list=streamDAO.getStream(sample);
		if(frequency==0)
		{
			if(Integer.parseInt(stream_list.get(0).getTextingcontacts())>days_weeks)
				returnText="You will lost "+(Integer.parseInt(stream_list.get(0).getTextingcontacts())-days_weeks)+" messages";
		}
		else if(frequency==2)
		{
			if(Integer.parseInt(stream_list.get(0).getTextingcontacts())>days_weeks)
				returnText="You will lost "+(Integer.parseInt(stream_list.get(0).getTextingcontacts())-days_weeks)+" messages";
	
		}
		else if(frequency==1)
		{
			if(Integer.parseInt(stream_list.get(0).getTextingcontacts())>(days_weeks*2))
			{
				returnText="You will lost "+(Integer.parseInt(stream_list.get(0).getTextingcontacts())-(days_weeks*2))+" messages";
				
			}
		}
		else if(frequency==3)
		{
			if(Integer.parseInt(stream_list.get(0).getTextingcontacts())>(days_weeks*3))
			{
				returnText="You will lost "+(Integer.parseInt(stream_list.get(0).getTextingcontacts())-(days_weeks*3))+" messages";
				
			}
		}			
		return returnText;
		
	}
	
	
	
	@RequestMapping(value={"/", "/viewallbroadcast"}, method = RequestMethod.GET)
	public String viewallpartGroup(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		BroadCastReportsForm broadCastReportsForm=new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
		
		model.addAttribute("broadCastReportsForm",broadCastReportsForm);
		model.addAttribute("noofrows",broadCastReportsForm.getBroadCastReports().size());    
       
        model.addAttribute("menu","message");
        model.addAttribute("button","close");
	      
	        model.addAttribute("menu","message");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
			return "viewreports";
 
	}
	
	
	
	
}
