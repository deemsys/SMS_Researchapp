package bephit.controllers;
 
import java.io.IOException;
import java.security.Principal;
import java.util.List;

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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;

@Controller
@SessionAttributes({"currentuser","admin"})
public class AdminUserController
{
	@Autowired
	AdminUserDAO adminuserDAO;
	
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.POST)
	public String addnewadminuser(HttpSession session,HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal)
	{
		session.setAttribute("admin",adminuser);
		if (result.hasErrors())
		{
		   model.addAttribute("menu","adminuser");
			 return "addadminuser";
		}
		System.out.println("Add AdminUser");
		model.put("success", "true");
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		adminuserDAO.setAdminUser(adminuser,principal.getName());
		session.removeAttribute("admin");
		model.addAttribute("menu","adminuser");
		return "addadminuser";
	}
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.GET)
	public String showaddnewadminuser(HttpSession session,HttpServletRequest request,ModelMap model)
	{
        session.invalidate();
		session.removeAttribute("admin");
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
	public String removeadminuser(@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
		int status=adminuserDAO.deleteAdminUser(admin_id,principal.getName());//.deleteParticipant(participant_id);
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
	
		int status=adminuserDAO.updateAdminUser(adminuser,principal.getName());//.deleteParticipant(participant_id);
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
	public String deleteSelectedadminuser(HttpServletRequest request,ModelMap model,String adminuser,Principal principal)
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		adminuserDAO.deleteAdminUser(principal.getName(),id);
		}
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
       
        return "viewadminuser";
		
	}

	@RequestMapping(value="/admindetails", method=RequestMethod.GET)
	public String streamdetails(HttpServletRequest request,@RequestParam("id") String admin_id,ModelMap model,StreamDetails streamdetails)
	{AdminUserForm adminuserForm = new AdminUserForm();
	adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
    model.addAttribute("adminuserForm",adminuserForm);
		return "admindetails";
	}	
	
	@RequestMapping(value="/showRegisterProvider", method=RequestMethod.GET)
	public String showRegisterProvider(HttpSession session,HttpServletRequest request,ModelMap model) {
			
		    session.removeAttribute("admin");		
			model.put("success", "false");			
			AdminUserForm adminuserForm = new AdminUserForm();
			adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
	        model.addAttribute("adminuserForm",adminuserForm);
	        return "registerprovider";
		}
	
	@RequestMapping(value="/registerprovider",method=RequestMethod.GET)
	public String showAddprovider(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("success","false");
		
        AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        model.addAttribute("menu","adminuser");
        
		return "/registerprovider";
	}
	/*@RequestMapping(value="/registerprovider", method=RequestMethod.POST)
	public String showAddProvider(HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal) {	

		 if (result.hasErrors())
		{
			 AdminUserForm adminuserform=new AdminUserForm();
		        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
		        model.addAttribute("adminuserform",adminuserform);
		        model.addAttribute("menu","adminuser");
	       return "registerprovider";
		} 
		    AdminUserForm adminuserform=new AdminUserForm();
	        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
	        model.addAttribute("adminuserform",adminuserform);
			adminuserDAO.setAdminUser(adminuser,principal.getName());
			model.addAttribute("menu","adminuser");
			return "login";
		
	
	}	*/
	
	@RequestMapping(value="/registerprovider", method=RequestMethod.POST)
	public String addproviderForm(HttpSession session,HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal) {
		
		session.setAttribute("admin",adminuser);
		//session.setAttribute("adminuser",adminuser);
		
		
		model.addAttribute("email_exist","false");
		model.addAttribute("mobile_exists","false");
		model.addAttribute("user_exists","false");
		int email_count=adminuserDAO.checkemail(adminuser.getAdmin_email());
		int mobile_count=adminuserDAO.checkmobile(adminuser.getAdmin_mobile());
		int user_count=adminuserDAO.checkuser(adminuser.getAdmin_username());
		if (result.hasErrors())
		{
			
			System.out.println("if email count: "+email_count);
			System.out.println(+user_count);
			System.out.println("mobile: "+mobile_count);
			
			if(email_count==0)
			{
				System.out.println("email exists");
				model.addAttribute("email_exist","true");
				
			}
			if(mobile_count==0)
			{ 
				System.out.println("mobile exists");
				model.addAttribute("mobile_exists","true");
							
			}
			if(user_count==0)
			{
				System.out.println("user exists");
				model.addAttribute("user_exists","true");
							
			}
			model.addAttribute("adminuser", adminuser);
			return "/registerprovider";
		}
		
		else			
		{
			System.out.println("else email count: "+email_count);
			System.out.println(+user_count);
			System.out.println("else mobile: "+mobile_count);
			
			if(email_count==0)
			{
				System.out.println("email exists");
				model.addAttribute("email_exist","true");
				model.addAttribute("adminuser", adminuser);
				return "/registerprovider";
				
			}
			else if(mobile_count==0)
			{ 
				System.out.println("mobile exists");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("adminuser", adminuser);
				return "/registerprovider";
							
			}
			else if(user_count==0)
			{
				System.out.println("user exists");
				model.addAttribute("user_exists","true");
				model.addAttribute("adminuser", adminuser);
				return "/registerprovider";
							
			}
			else
			{
				adminuserDAO.setAdminUser(adminuser,"personal");
				model.addAttribute("Regsuccess","true");
				return "/login";
			}
			}
		
			
			
		}
	
	}
