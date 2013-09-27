package bephit.controllers;
 
import java.io.IOException;
import java.security.Principal;

import org.springframework.validation.BindingResult;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.util.RedirectUrlBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;

@Controller
@SessionAttributes("currentuser")
public class AdminUserController
{
	@Autowired
	AdminUserDAO adminuserDAO;
	
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.POST)
	public String addnewadminuser(HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal)
	{
		
		if (result.hasErrors())
		{
		   model.addAttribute("menu","adminuser");
			 return "addadminuser";
		}
		System.out.println("Add AdminUser");
		model.put("success", "true");
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		adminuserDAO.setAdminUser(adminuser,principal.getName());
		model.addAttribute("menu","adminuser");
		return "addadminuser";
	}
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.GET)
	public String showaddnewadminuser(HttpServletRequest request,ModelMap model)
	{
		model.put("success", "false");
		  model.addAttribute("menu","adminuser");
		  model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		return "addadminuser";
	}
	
	
	
	@RequestMapping(value="/viewadminuser",method=RequestMethod.GET)
	public String viewadminusers(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("success","false");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm", adminuserForm);	
        model.addAttribute("menu","adminuser");
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		return "viewadminuser";
	}
	
	
	@RequestMapping(value="/deleteadminuser", method=RequestMethod.GET)
	public String removeParticipants(@RequestParam("id") String admin_id,ModelMap model, Principal principal,AdminUser adminuser ) {
	
		int status=adminuserDAO.deleteAdminUser(adminuser,principal.getName());//.deleteParticipant(participant_id);
		if(status==1)
		{
        model.addAttribute("success","true");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
		}
		  model.addAttribute("menu","adminuser");
		return "viewadminuser";
	}
	
	
	@RequestMapping(value="/editadminuser", method=RequestMethod.GET)
	public String editadminuser(HttpServletRequest request,@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
       
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
	        model.addAttribute("menu","adminuser");
	        return "editadminuser";
		}
		System.out.println(status);
		model.addAttribute("success","true");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
        
        
        AdminUserForm adminuserForm1 = new AdminUserForm();
		adminuserForm1.setAdminuser(adminuserDAO.getAdminUserby_username(principal.getName()));
        model.addAttribute("currentuser",adminuserForm1);
		return "viewadminuser";
	}
	
	
	
	@RequestMapping(value="/permission", method=RequestMethod.GET)
	public void permitadminuser(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") String admin_id,@RequestParam("status") String status,ModelMap model) throws IOException 
	{	
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
        System.out.println(request.getRequestURL());
        adminuserDAO.setPermission_adminUser(admin_id,status);        
        response.sendRedirect("viewadminuser");
	}
	
	
	
	
	@RequestMapping(value="/deleteSelectedadminuser", method=RequestMethod.POST)
	public String deleteSelectedadminuser(HttpServletRequest request,ModelMap model,AdminUser adminuser)
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		adminuserDAO.deleteAdminUser(adminuser,id);
		}
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
        System.out.println(request.getRequestURL());
        return "viewadminuser";
		
	}
		
	
	
	
	
}