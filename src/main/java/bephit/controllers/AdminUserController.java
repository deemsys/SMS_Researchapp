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

@Controller
public class AdminUserController
{
	@Autowired
	AdminUserDAO adminuserDAO;
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.POST)
	public String addnewadminuser(@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model)
	{
		
		if (result.hasErrors())
		{
			//model.addAttribute("userProfile", userProfile);
			 return "addadminuser";
		}
		System.out.println("Add AdminUser");
		model.put("success", "true");
		adminuserDAO.setAdminUser(adminuser);
		return "addadminuser";
	}
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.GET)
	public String showaddnewadminuser(ModelMap model)
	{
		model.put("success", "false");
		return "addadminuser";
	}
	
	
	
	@RequestMapping(value="/viewadminuser",method=RequestMethod.GET)
	public String viewadminusers(ModelMap model)
	{
		model.addAttribute("success","false");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm", adminuserForm);		
		return "viewadminuser";
	}
	
	
	@RequestMapping(value="/deleteadminuser", method=RequestMethod.GET)
	public String removeParticipants(@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
		int status=adminuserDAO.deleteAdminUser(admin_id);//.deleteParticipant(participant_id);
		if(status==1)
		{
        model.addAttribute("success","true");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
		}
		return "viewadminuser";
	}
	
	
	@RequestMapping(value="/editadminuser", method=RequestMethod.GET)
	public String editadminuser(@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
        model.addAttribute("adminuserForm",adminuserForm);
        return "editadminuser";
	}
	
	
	@RequestMapping(value="/updateadminuser", method=RequestMethod.POST)
	public String updateParticipants(@ModelAttribute("adminuser") @Valid AdminUser adminuser,BindingResult result,ModelMap model, Principal principal) {
	
		int status=adminuserDAO.updateAdminUser(adminuser, adminuser.getAdmin_id());//.deleteParticipant(participant_id);
		if (result.hasErrors())
		{
			AdminUserForm adminuserForm = new AdminUserForm();
			adminuserForm.setAdminuser(adminuserDAO.getAdminUser(adminuser.getAdmin_id()));
	        model.addAttribute("adminuserForm",adminuserForm);
	        return "editadminuser";
		}
		System.out.println(status);
		model.addAttribute("success","true");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
		return "viewadminuser";
	}
	
	
	
	
}