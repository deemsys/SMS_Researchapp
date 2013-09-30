package bephit.controllers;

import java.io.IOException;
import java.security.Principal;

import org.springframework.validation.BindingResult;
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
		/*
		 * if(result != null) { return "createstream"; } else {
		 */
		String[] Messages = new String[100];
		Messages = request.getParameterValues("message[]");
		streamDAO.insertNewstream(streamdetails, principal.getName(), Messages);
		model.addAttribute("success", "true");
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