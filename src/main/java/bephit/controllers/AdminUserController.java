package bephit.controllers;
 
import java.security.Principal;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/adminuser/new", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/addnewadminuser", method=RequestMethod.GET)
	public String showaddnewadminuser(ModelMap model)
	{
		model.put("success", "false");
		return "addadminuser";
	}
	
	
	
	@RequestMapping(value="/viewadminuser",method=RequestMethod.GET)
	public String viewadminusers(ModelMap model)
	{
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm", adminuserForm);		
		return "viewadminuser";
	}
	
	
	
	
}