package bephit.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bephit.dao.BroadCastDAO;
import bephit.dao.ParticipantGroupDAO;
//import bephit.dao.StreamDetailsDAO;
import bephit.dao.StreamDetailsDAO;
import bephit.forms.AdminUserForm;
import bephit.forms.BroadCastForm;
import bephit.forms.BroadCastReportsForm;
import bephit.forms.ParticipantsGroupForm;
import bephit.forms.StreamDetailsForm;
import bephit.model.BroadCast;
import bephit.model.BroadCastReports;
import bephit.model.TwilioSMS;
import bephit.model.UserProfile;

@Controller
public class BroadCastController {

	@Autowired
	BroadCastDAO broadDAO;
	
	
	@Autowired  
	TwilioSMS messageSender;
	
	 @Autowired    
	    ParticipantGroupDAO partDAO;
	
	@Autowired
	StreamDetailsDAO streamDAO;
	
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

	
	@RequestMapping(value = "/sendstream", method = RequestMethod.POST)
	public String insertsendstream(@ModelAttribute("broadCastReports") @Valid BroadCast broadCast,BindingResult result,ModelMap model,Principal principal) {
		
        
        if (result.hasErrors())
        {
        	model.addAttribute("menu","message");
    	    return "sendstream";
        }
        else
        	
        {
            System.out.println("insert broad id" +broadCast.getBroad_id());
        	 broadDAO.insertNewBroadCast(broadCast);  
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
        
	    /*model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
	     model.addAttribute("noofrows",streamForm.getStreamDetails().size());       
	    streamForm.setStreamDetails(streamDAO.getlimitedstream(1));
			model.addAttribute("noofpages",(int) Math.ceil(streamDAO.getnoofstream() * 1.0 / 5));	 
	        model.addAttribute("button","viewall");*/
		model.addAttribute("menu","message");
		return "viewreports";
	}
	
	
	
}
