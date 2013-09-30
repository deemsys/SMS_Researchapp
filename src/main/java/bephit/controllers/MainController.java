package bephit.controllers;
 
import java.security.Principal;
import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;
//import bephit.Validation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
 
@Controller
@SessionAttributes("currentuser")
public class MainController {
	
	@Autowired  
	MainDAO mainDAO; 
	
    @Autowired
    UserDAO userDAO;
    
    @Autowired    
    ParticipantGroupDAO partDAO;
 
    @Autowired  
	EmailSender emailSender;
    
    @Autowired 
    AdminUserDAO adminuserdao;
    
    @Autowired  
	TwilioSMS messageSender;
	
    
    
	
    private static final Logger logger = LoggerFactory.getLogger(MainController.class); //Logger
	
	@RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,ModelMap model, Principal principal ) {
		

        
		
       	ParticipantsDetailsForm participantsDetailsForm1 = new ParticipantsDetailsForm();
		participantsDetailsForm1.setParticipantsDetails(mainDAO.getParticipants());         
        ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("currentpage",1);      
        model.addAttribute("noofrows",participantsDetailsForm1.getParticipantsDetails().size());       
        participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 5));	 
        model.addAttribute("menu","dashboard");
        model.addAttribute("success","false");
        model.addAttribute("button","viewall");
        ModelAndView mav = new ModelAndView("dashboard");
        
         //session start       
        AdminUserForm adminUserForm=new AdminUserForm();
        adminUserForm.setAdminuser(adminuserdao.getAdminUserby_username(principal.getName()));      
        mav.addObject("currentuser", adminUserForm);
        //session stop
       
        
		return mav;
 
	}
	@RequestMapping(value={"/", "/viewall"}, method = RequestMethod.GET)
	public String viewallpart(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);       
        model.addAttribute("noofrows",mainDAO.getParticipants().size());       
        model.addAttribute("menu","dashboard");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
		return "dashboard";
 
	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request,ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(HttpServletRequest request,ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(HttpServletRequest request,Model model,Principal principal) {
     model.addAttribute(new UserProfile());
     model.addAttribute("Regsuccess", "false");
    	  return "edit";
    
    
	}
	
	
	@RequestMapping(value="/forgotpwd", method=RequestMethod.GET)
	public String showForgotpassword(HttpServletRequest request,Model model) {
	//	model.addAttribute(new UserProfile());
		
		
		
		
	return "forgotpwd";
	}
	

	
	@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(HttpServletRequest request,@ModelAttribute("userProfile") @Valid UserProfile userProfile,
			BindingResult result,ModelMap model,Principal principal) {
		if (result.hasErrors())
		{
			if(userDAO.checkUsername(userProfile.getUsername())==1)
			{
				model.addAttribute("userProfile", userProfile);
				return "/edit";
			}
			else
			{
				model.addAttribute("username_exist","true");
				model.addAttribute("userProfile", userProfile);
				return "/edit";
			}
			
		}
		else
		{
		if(userDAO.checkUsername(userProfile.getUsername())==1)
		{
		System.out.println("Save User" + userProfile.getFullName());
		userDAO.setUser(userProfile);
		model.addAttribute("Regsuccess", "true");
		return "login";
		}
		else
		{
			model.addAttribute("username_exist","true");
	     	model.addAttribute("userProfile", userProfile);
		    return "/edit";
		}
		}
			
	}
	
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(HttpServletRequest request,ModelMap model) {
		
		model.put("success", "false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("menu","participants");
	     return "addparticipants";
	}
	
	@RequestMapping(value="/addparticipants",method=RequestMethod.GET)
	public String showAddpart(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("menu","participants");
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
		return "/addparticipants";
	}
	
	@RequestMapping(value="/addparticipants", method=RequestMethod.POST)
	public String showAddParticipants(HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal) {		
		if (result.hasErrors())
		{
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
	        model.addAttribute("menu","participants");
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
		int a=mainDAO.setParticipants(participant,principal.getName());
				model.put("success","true");
				
				 model.addAttribute("menu","participants");
				    ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
					participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
			        model.addAttribute("participantsDetailsForm", participantsDetailsForm);	
			        model.addAttribute("menu","dashboard");
			        model.addAttribute("noofrows",mainDAO.getParticipants().size());
					return "dashboard";
		
	}
		
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(HttpServletRequest request,ModelMap model, Principal principal) {
		 model.addAttribute("success","false");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
        
		return "viewparticipants";
	}
	
	
	@RequestMapping(value="/deleteparticipants", method=RequestMethod.GET)
	public String removeParticipants(@RequestParam("id") String participant_id,ModelMap model, Principal principal) {
	
		int status=mainDAO.deleteParticipant(participant_id,principal.getName());
		if(status==1)
		{
        model.addAttribute("success","true");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
		}
		 model.addAttribute("menu","participants");
		return "viewparticipants";
	}
	
	
	//Groups
	
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(HttpServletRequest request,ParticipantGroups pgroups,ModelMap model) {		
	
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);        
		//partDAO.setParticipantGroup(pgroups);	
        model.addAttribute("success","false");
        model.addAttribute("menu","participants");
		return "addparticipantgroups";
	}
	
	
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.POST)
	public String NewParticipantGroups(HttpServletRequest request,@ModelAttribute("pgroups") @Valid ParticipantGroups pgroups,
			BindingResult result,ModelMap model) {
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		if(pgroups.getgroup_scope()=="1")
		{
		  if (result.hasErrors())
		   {
			    if(partDAO.checkGroupname(pgroups)==1)
			     {
			              if(result.hasFieldErrors("group_decs"))
			                {
			                participantGroupForm.setParticipantGroups(partDAO.getGroups());
	                        model.addAttribute("participantGroupForm", participantGroupForm);
	                        model.addAttribute("menu","participants");
	                        return "addparticipantgroups";
			               }
			     }
	             else
		         {
	            	 if(result.hasFieldErrors("group_decs"))
		                {
		                participantGroupForm.setParticipantGroups(partDAO.getGroups());
                        model.addAttribute("participantGroupForm", participantGroupForm);
                        model.addAttribute("username_exist","true");
                        model.addAttribute("menu","participants");
                        return "addparticipantgroups";
		               }
	                    	
		         }
		    }
		}
		else
		{
			if(partDAO.checkGroupname(pgroups)==1)
			{
			            if(result.hasFieldErrors("group_decs"))
			      {
				        participantGroupForm.setParticipantGroups(partDAO.getGroups());
		                model.addAttribute("participantGroupForm", participantGroupForm);
		                model.addAttribute("menu","participants");
		                return "addparticipantgroups";
			      }
			}
			else
			{
				        participantGroupForm.setParticipantGroups(partDAO.getGroups());
                        model.addAttribute("participantGroupForm", participantGroupForm);
			            model.addAttribute("username_exist","true");
			            model.addAttribute("menu","participants");
			            return "addparticipantgroups";
			}
		}
			

		if(partDAO.checkGroupname(pgroups)==1)
		{	
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("success","true");
		partDAO.setParticipantGroup(pgroups);
		model.addAttribute("menu","participants");
		return "addparticipantgroups";
		}
		else
		{
		model.addAttribute("username_exist","true");
		model.addAttribute("menu","participants");
		return "addparticipantgroups";
		}
		
		 
	}
	
	
	
	
	
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.GET)
	public String AddParticipantGroups(HttpServletRequest request,ParticipantGroups pgroups,ModelMap model) {
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		//partDAO.setParticipantGroup(pgroups);
        model.addAttribute("menu","participants");
		return "addparticipantgroups";
	}
	
	
	
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(HttpServletRequest request,ModelMap model) {
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","participants");
		return "viewparticipantgroups";
	}
	
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(HttpServletRequest request,ModelMap model) {
		 model.addAttribute("menu","adminuser");
		return "addadminuser";
	}
	/*@RequestMapping(value="/viewadminuser", method=RequestMethod.GET)
	public String viewAdminUser(ModelMap model) {
		
		return "viewadminuser";
	}*/
	/*
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(HttpServletRequest request,ModelMap model) {
		
		return "activityofadmin";
	}*/
	
	@RequestMapping(value="/textmsgsettings", method=RequestMethod.GET)
	public String textMsgSettings(HttpServletRequest request,ModelMap model) {
		
		return "textmsg";
	}
	
	@RequestMapping(value="/changepassword",method=RequestMethod.GET)
	public String changemypassword(HttpServletRequest request,ModelMap model)
	{
		return "changepwd";
	}
	
	@RequestMapping(value="/findParticipant",method=RequestMethod.GET)
	public String findparticipant(HttpServletRequest request,@RequestParam("mobile") String mobile,@RequestParam("groupname") String groupname,@RequestParam("city") String city,ModelMap model)
	{
		if(mobile==""&&groupname==""&&city=="")
		{
			ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
			participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
	        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
	        model.addAttribute("menu","participants");
	        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
			return "viewparticipants";
		}
		else
		{
			System.out.println(mobile);
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(mobile,groupname,city));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		return "viewparticipants";
		}
		
	}
	
	
	//editparticipants
	
	
	
	@RequestMapping(value="/editparticipant", method=RequestMethod.GET)
	public String editParticipant(HttpServletRequest request,@RequestParam("id") String participants_id,ModelMap model,ParticipantsDetails participant)
	{
	
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	
        model.addAttribute("menu","participants");
		return "edit_participants";
	}
	
	
	
	@RequestMapping(value="/updateparticipant", method=RequestMethod.POST)
	public String updateParticipant(HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal)
	{
		
		if (result.hasErrors())
		{
			ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
	        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));
	        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
			    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				participantGroupForm.setParticipantGroups(partDAO.getGroups());
		        model.addAttribute("participantGroupForm", participantGroupForm);	
		        model.addAttribute("menu","participants");
		        return "edit_participants";
		}
		int status=mainDAO.updateParticipants(participant, participant.getParticipants_id(),principal.getName());
		System.out.println(status);

		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
	        model.addAttribute("menu","participants");
	        model.addAttribute("success","true");
		return "viewparticipants";
	}
	
	
	//Delete ParticipantGroups
	
	@RequestMapping(value="/deleteparticipantgroup", method=RequestMethod.GET)
	public String deleteParticipantgroup(HttpServletRequest request,@RequestParam("id") String group_id,ModelMap model, Principal principal)
	{
	
		int status=partDAO.deleteParticipantgroup(group_id);
		if(status==1)
		{
	    model.addAttribute("success","true");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","participants");
		}
		 model.addAttribute("menu","participants");
		return "viewparticipantgroups";
	}
	
	
	@RequestMapping(value="/deleteparticipantgroup", method=RequestMethod.POST)
	public String deleteParticipantgroup(HttpServletRequest request,ModelMap model, Principal principal)
	{
	
		int status = 0;
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		status=partDAO.deleteParticipantgroup(id);
		}
		
		if(status==1)
		{
	    model.addAttribute("success","true");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","participants");
		}
		 model.addAttribute("menu","participants");
		return "viewparticipantgroups";
	}
	
	
	
	@RequestMapping(value="/participantdetails", method=RequestMethod.GET)
	public String participantdetails(HttpServletRequest request,@RequestParam("id") String participants_id,ModelMap model,ParticipantsDetails participant)
	{
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	*/
        model.addAttribute("menu","dashboard");
		return "participantdetails";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/viewparticipant_page", method=RequestMethod.GET)
	public String pageParticipants(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
	    ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(page));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 5));
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","dashboard");
        model.addAttribute("button","viewall");
		return "dashboard";
		
	}	
	
	
	
	@RequestMapping(value="/deleteSelectedparticipants", method=RequestMethod.POST)
	public String deleteSelectedParticipants(HttpServletRequest request,ModelMap model,Principal principal) 
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		mainDAO.deleteParticipant(id,principal.getName());
		}
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
		return "viewparticipants";
		
	}	
	
	
	
	@RequestMapping(value="/sendforgotpassword", method=RequestMethod.POST)
	public String sendforgot_password(HttpServletRequest request,ModelMap model) 
	{	
		//------------------------------------------------------------------------//
		
		String mail=request.getParameter("email_id").toString();
	    System.out.println(mail);
		logger.info("--Before Sending--"); //Logger Test
        //Email Test
        emailSender.sendEmail(mail, "learnguild@gmail.com", "Hi");
        logger.info("--After Sent--");
      /*  model.addAttribute("success","true");
       */ 
        try{
        	messageSender.sendSMS("6144670389", "Deemsys test");
        }catch(Exception e){e.printStackTrace();}
        
        
      //------------------------------------------------------------------------//
        
        
        return "login";
		
		
		
	}	
	
	
	
	
	
  }