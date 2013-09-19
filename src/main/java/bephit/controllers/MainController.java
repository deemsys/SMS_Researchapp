package bephit.controllers;
 
import java.security.Principal;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;
//import bephit.Validation.*;

 
 
@Controller
@SessionAttributes("success")
public class MainController {
	
	@Autowired  
	MainDAO mainDAO; 
	
    @Autowired
    UserDAO userDAO;
    
    @Autowired    
    ParticipantGroupDAO partDAO;
 
    /*
    @Autowired 
    AdminUserDAO adminuserdao;
	
	@RequestMapping(value="/addnewadminuser", method = RequestMethod.GET)
	public String addnewAdminUser(ModelMap model)
	{
		return "addadminuser"; 
	}
		
    
    */
    
    
    
	@RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	public String printWelcome(ModelMap model, Principal principal ) {
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);		
		return "dashboard";
 
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(Model model) {
		model.addAttribute(new UserProfile());
	return "edit";
	}
	
	
	@RequestMapping(value="/forgotpwd", method=RequestMethod.GET)
	public String showForgotpassword(Model model) {
	//	model.addAttribute(new UserProfile());
	return "forgotpwd";
	}
	
	
	
	
	
	@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(@ModelAttribute("userProfile") @Valid UserProfile userProfile,
			BindingResult result,ModelMap model) {
		if (result.hasErrors())
		{
			model.addAttribute("userProfile", userProfile);
			 return "/edit";
		}
		System.out.println("Save User" + userProfile.getFullName());
		userDAO.setUser(userProfile);
		model.put("success", "Registration Successfull");
		return "/edit";
	}
	
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(ModelMap model) {
		
		model.put("success", "false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
	     return "addparticipants";
	}
	
	@RequestMapping(value="/addparticipants",method=RequestMethod.GET)
	public String showAddpart(ModelMap model)
	{
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		
		return "/addparticipants";
	}
	
	@RequestMapping(value="/addparticipants", method=RequestMethod.POST)
	public String showAddParticipants(@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model) {		
		if (result.hasErrors())
		{
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
	       return "addparticipants";
		}
		model.put("participant", participant);		
		//validation valid=new validation();
		String[] errmsges=new String[50];
	//errmsges=valid.checkParticipant(participant);	
		model.put("errmsg",errmsges[0]);
		model.addAttribute("participantsDetailsForm", participant);
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);			
		int a=mainDAO.setParticipants(participant);
				model.put("success","true");
		return "/addparticipants";

		
	}
		
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(ModelMap model, Principal principal) {
		 model.addAttribute("success","false");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		return "viewparticipants";
	}
	
	
	@RequestMapping(value="/deleteparticipants", method=RequestMethod.GET)
	public String removeParticipants(@RequestParam("id") String participant_id,ModelMap model, Principal principal) {
	
		int status=mainDAO.deleteParticipant(participant_id);
		if(status==1)
		{
        model.addAttribute("success","true");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		}
		return "viewparticipants";
	}
	
	
	//Groups
	
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(ParticipantGroups pgroups,ModelMap model) {		
	
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);        
		//partDAO.setParticipantGroup(pgroups);	
        model.addAttribute("success","false");
		return "addparticipantgroups";
	}
	
	
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.POST)
	public String NewParticipantGroups(@ModelAttribute("pgroups") @Valid ParticipantGroups pgroups,
			BindingResult result,ModelMap model) {
		if(pgroups.getgroup_scope()=="1")
		{
		if (result.hasErrors())
		{
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
	       return "addparticipantgroups";
		}
		}
		else
		{
			if(result.hasFieldErrors("group_decs"))
			{
				ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				participantGroupForm.setParticipantGroups(partDAO.getGroups());
		        model.addAttribute("participantGroupForm", participantGroupForm);
		        return "addparticipantgroups";
			}
		}
		
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("success","true");
		partDAO.setParticipantGroup(pgroups);
		return "addparticipantgroups";
	}
	
	
	
	
	
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.GET)
	public String AddParticipantGroups(ParticipantGroups pgroups,ModelMap model) {
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		//partDAO.setParticipantGroup(pgroups);
		return "addparticipantgroups";
	}
	
	
	
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(ModelMap model) {
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
		return "viewparticipantgroups";
	}
	
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(ModelMap model) {
		
		return "addadminuser";
	}
	/*@RequestMapping(value="/viewadminuser", method=RequestMethod.GET)
	public String viewAdminUser(ModelMap model) {
		
		return "viewadminuser";
	}*/
	
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(ModelMap model) {
		
		return "activityofadmin";
	}
	
	@RequestMapping(value="/textmsgsettings", method=RequestMethod.GET)
	public String textMsgSettings(ModelMap model) {
		
		return "textmsg";
	}
	
	@RequestMapping(value="/changepassword",method=RequestMethod.GET)
	public String changemypassword(ModelMap model)
	{
		return "changepwd";
	}
	
	@RequestMapping(value="/findParticipant",method=RequestMethod.GET)
	public String findparticipant(@RequestParam("mobile") String mobile,@RequestParam("groupname") String groupname,@RequestParam("city") String city,ModelMap model)
	{
		System.out.println(mobile);
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(mobile,groupname,city));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		return "viewparticipants";
		//return "viewparticipants";
	}
	
	
	//editparticipants
	
	
	
	@RequestMapping(value="/editparticipant", method=RequestMethod.GET)
	public String editParticipant(@RequestParam("id") String participants_id,ModelMap model,ParticipantsDetails participant)
	{
	
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	
		return "edit_participants";
	}
	
	
	
	@RequestMapping(value="/updateparticipant", method=RequestMethod.POST)
	public String updateParticipant(@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model)
	{
		
		if (result.hasErrors())
		{
			ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
	        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));
	        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
			    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				participantGroupForm.setParticipantGroups(partDAO.getGroups());
		        model.addAttribute("participantGroupForm", participantGroupForm);	
		        return "edit_participants";
		}
		int status=mainDAO.updateParticipants(participant, participant.getParticipants_id());
		System.out.println(status);

		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
      
		return "edit_participants";
	}
	
	
	
	
	
  }