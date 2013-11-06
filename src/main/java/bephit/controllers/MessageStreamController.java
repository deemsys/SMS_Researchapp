package bephit.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bephit.dao.StreamDetailsDAO;
import bephit.forms.StreamDetailsForm;
import bephit.model.StreamDetails;

@Controller
public class MessageStreamController {

	@Autowired
	StreamDetailsDAO streamDAO;

	@RequestMapping(value = "/createstream", method = RequestMethod.GET)
	public String createstream(ModelMap model) {
		String StreamID = streamDAO.getMaxStreamID();
		model.addAttribute("currentstream", StreamID);
		return "createstream";
	}

	@RequestMapping(value = "/insertstream", method = RequestMethod.POST)
	public String insertstream(
			HttpServletRequest request,
			ModelMap model,
			Principal principal,
			@ModelAttribute("streamdetails") @Valid StreamDetails streamdetails,
			BindingResult result) {
		/*if (result.hasErrors()) {
		StreamDetailsForm stForm=new StreamDetailsForm();
		stForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("menu", "streamdetails");
		return "createstream";
			
		}*/
		System.out.println("message stream created");
		model.put("success", "true");
		/*
		 * if(result != null) { return "createstream"; } else {
		 */
		String[] Messages = new String[100];
		Messages = request.getParameterValues("message[]");
		streamDAO.insertNewstream(streamdetails, principal.getName(), Messages);
//		model.addAttribute("success", "true");
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
		return "viewstream";

		/* } */
	}

	@RequestMapping(value = "/viewstream", method = RequestMethod.GET)
	public String viewstream(ModelMap model) {
		model.addAttribute("success", "false");
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
		return "viewstream";
	}

	
}