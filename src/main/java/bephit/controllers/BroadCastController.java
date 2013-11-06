package bephit.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bephit.dao.BroadCastDAO;
import bephit.dao.MainDAO;
import bephit.dao.ParticipantGroupDAO;
//import bephit.dao.StreamDetailsDAO;
import bephit.dao.StreamDetailsDAO;
import bephit.forms.BroadCastForm;
import bephit.forms.BroadCastReportsForm;
import bephit.forms.ParticipantsDetailsForm;
import bephit.forms.ParticipantsGroupForm;
import bephit.forms.StreamDetailsForm;
import bephit.model.BroadCast;
import bephit.model.ParticipantsDetails;
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
	@Autowired
	MainDAO mainDAO;
	@Autowired
	ParticipantGroupDAO participantGroupDAO;

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

		return "sendstream";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertsendstream", method = RequestMethod.POST)
	public String insertsendstream(@ModelAttribute("broadCast"

	) @Valid BroadCast broadCast, BindingResult result, ModelMap model) {
		// List<ParticipantsDetails>
		// parts=mainDAO.getParticipantsbyGroupName(broadCast.getGroup_id());

		HashMap<String, ArrayList<ParticipantsDetails>> map = mainDAO
				.getAllParticipants();

		String grname = participantGroupDAO.getGroupName(broadCast
				.getGroup_id());
		ArrayList<ParticipantsDetails> list = map.get(grname);

		int status = broadDAO.insertNewBroadCast(broadCast);
		/*
		 * for (ParticipantsDetails participantsDetails : list) { try {
		 * messageSender.sendSMS(participantsDetails.getMobile_num(),
		 * "Deemsys test"); //messageSender.sendSMS("9209312567",
		 * "Deemsys test again"); } catch (Exception e) { e.printStackTrace(); }
		 * }
		 */
		try {
			messageSender.sendSMS("6144670389", "Deemsys test");
			messageSender.sendSMS("9209312567", "Deemsys test again");
		} catch (Exception e) {
			e.printStackTrace();
		}

		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
		BroadCastForm broadCastForm = new BroadCastForm();
		broadCastForm.setBroadCast(broadDAO.getBroadCast());
		model.addAttribute("broadCastForm", broadCastForm);
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
		model.addAttribute("participantGroupForm", participantGroupForm);

		/* to display report */

		model.addAttribute("success", "false");

		BroadCastForm broadCastForm1 = new BroadCastForm();
		broadCastForm1.setBroadCast(broadDAO.getBroadCast());
		model.addAttribute("broadCastForm", broadCastForm1);

		StreamDetailsForm streamForm1 = new StreamDetailsForm();
		streamForm1.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm1);

		ParticipantsGroupForm participantGroupForm1 = new ParticipantsGroupForm();
		participantGroupForm1.setParticipantGroups(partDAO.getGroups());
		model.addAttribute("participantGroupForm", participantGroupForm1);
		BroadCastReportsForm broadCastReportsForm = new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
		model.addAttribute("broadCastReportsForm", broadCastReportsForm);

		return "viewreports";

		/* display report ends */
	}

	@RequestMapping(value = "/viewreports", method = RequestMethod.GET)
	public String viewreports(ModelMap model) {
		model.addAttribute("success", "false");

		BroadCastForm broadCastForm = new BroadCastForm();
		broadCastForm.setBroadCast(broadDAO.getBroadCast());
		model.addAttribute("broadCastForm", broadCastForm);

		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);

		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
		model.addAttribute("participantGroupForm", participantGroupForm);
		BroadCastReportsForm broadCastReportsForm = new BroadCastReportsForm();
		broadCastReportsForm.setBroadCastReports(broadDAO.getReports());
		model.addAttribute("broadCastReportsForm", broadCastReportsForm);

		return "viewreports";
	}

}
