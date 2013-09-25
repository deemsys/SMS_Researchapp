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
public class MessageStreamController
{
	

	@RequestMapping(value="/createstream",method=RequestMethod.GET)
		public String createstream(ModelMap model)
		{
			return "createstream";
		}
		
		@RequestMapping(value="/viewstream",method=RequestMethod.GET)
		public String viewstream(ModelMap model)
		{
			return "viewstream";
		}
		@RequestMapping(value="/broadcast",method=RequestMethod.GET)
		public String sendstream(ModelMap model)
		{
			return "sendstream";
		}
		
		@RequestMapping(value="/viewreports",method=RequestMethod.GET)
		public String viewreports(ModelMap model)
		{
			return "viewreports";
		}
}