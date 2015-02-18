package com.tabner.controllers.lead;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Activity;
import com.tabner.model.Lead;
import com.tabner.model.Tdmin;
import com.tabner.persistence.ActivityService;
import com.tabner.persistence.LeadService;
import com.tabner.persistence.ListOfValuesService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="lead")
public class LeadFetch {
	private LeadService leadService=null;
	private TdminService tdminService=null;	
	private ListOfValuesService listofvaluesService=null;	
	private ActivityService activityService=null;

	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setLeadService(LeadService leadService) {
		this.leadService = leadService;
	}
	@Autowired
	public void setListOfValuesService(ListOfValuesService listofvaluesService) {
		this.listofvaluesService = listofvaluesService;
	}
	@Autowired
	public void setActivityService(ActivityService activityService){
		this.activityService = activityService;
	}

	@RequestMapping(value="fetch", method=RequestMethod.POST)
	@ResponseBody
	public List<Lead> fetch(Lead lead, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Lead> response = leadService.getAllLeads();
			return response;
		}		
	}
	@RequestMapping(value="leads", method=RequestMethod.GET)
	public ModelAndView showLoginForm(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.addObject("leads", leadService.getAllLeads());
			mv.addObject("listvalues", listofvaluesService.getListOfValuesByListType("LEAD_TYPE"));
			mv.addObject("curstatus", listofvaluesService.getListOfValuesByListType("LEAD_CUR_STATUS"));
			mv.setViewName("lead");
			return mv;
		}
	}
	

	@RequestMapping(value="details",method=RequestMethod.POST, params="lid")
	@ResponseBody
	public ModelAndView details(@RequestParam("lid") String lid, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("email", email);
			mv.addObject("lead", leadService.getLeadById(lid));
			mv.addObject("lactivities", activityService.getActivityByLeadId(lid));
			List<Activity> list =  activityService.getActivityByLeadId(lid);
			mv.addObject("listvalues", listofvaluesService.getListOfValuesByListType("Activity_TYPE"));
			mv.addObject("activitystatus", listofvaluesService.getListOfValuesByListType("Activity_STATUS"));
			System.out.println(list.get(0).getActivity_type());
			mv.setViewName("lead_details");
			return mv;
		}		
	}

	
}
