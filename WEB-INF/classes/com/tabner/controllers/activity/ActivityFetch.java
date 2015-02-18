package com.tabner.controllers.activity;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Activity;
import com.tabner.model.Notes;
import com.tabner.persistence.ActivityService;
import com.tabner.persistence.NotesService;

@Controller
@RequestMapping(value="/activity")
public class ActivityFetch {
	private ActivityService activityService=null;	
	private NotesService notesService=null;	
	@Autowired
	public void setNotesService(NotesService notesService) {
		this.notesService = notesService;
	}
	@Autowired
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	@RequestMapping(value="fetch", method=RequestMethod.POST, params="leadID")
	@ResponseBody
	public List<Activity> fetch(@RequestParam("leadID") String leadID, Activity activity, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Activity> response = activityService.getActivityByLeadId(leadID);
			return response;
		}		
	}
	
	@RequestMapping(value="details",method=RequestMethod.POST, params="aid")
	@ResponseBody
	public ModelAndView update(@RequestParam("aid") String aid, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("email", email);
			mv.addObject("activity", activityService.getActivityById(aid));
			//System.out.println(empid);
			List<Notes> noteslist = notesService.getNotesByActivityId(aid);
			//List<Attachment> attachmentlist = vendorService.getVendorByEid(empid);
			mv.addObject("notes", noteslist);
			mv.setViewName("activity_details");
			return mv;
		}		
	}

}
