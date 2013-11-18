package bephit.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bephit.dao.BroadCastDAO;
import bephit.dao.ParticipantGroupDAO;
//import bephit.dao.StreamDetailsDAO;
import bephit.dao.StreamDetailsDAO;
import bephit.forms.ParticipantsGroupForm;
import bephit.forms.StreamDetailsForm;
import bephit.model.BroadCast;
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
	public String insertsendstream(@ModelAttribute("broadCast") @Valid BroadCast broadCast,BindingResult result,ModelMap model) {
		
        
        if (result.hasErrors())
        {
            System.out.println("Error came");
    		StreamDetailsForm streamForm = new StreamDetailsForm();
    		streamForm.setStreamDetails(streamDAO.getStream());
    		model.addAttribute("streamForm", streamForm);	
    	    return "sendstream";
        }
        else
        	
        {
       /* System.out.println("Error but ???");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);*/ 
        	   int status=broadDAO.insertNewBroadCast(broadCast);  
        	      
        	model.addAttribute("menu","message");
        return "viewstream";
        }
      /*  
        try{
        	//messageSender.sendSMS("6144670389", "Deemsys test");
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	}*/
        
	
		
	}

	
	
	
	
	
	
	
	@RequestMapping(value = "/viewreports", method = RequestMethod.GET)
	public String viewreports(ModelMap model) {
		model.addAttribute("menu","message");
		return "viewreports";
	}
	
	
	
}
