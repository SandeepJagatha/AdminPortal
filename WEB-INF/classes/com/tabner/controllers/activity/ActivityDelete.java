package com.tabner.controllers.activity;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.ActivityService;

@Controller
@RequestMapping(value="/activity")
public class ActivityDelete {
	private ActivityService activityService=null;	
	@Autowired
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	

	@RequestMapping(value="delete", method=RequestMethod.POST, params="aid")
	@ResponseBody
	public String delete(@RequestParam("aid") String aid, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			
			System.out.println(aid);
			activityService.deleteActivity(aid);
			return "Deleted Activity successfully";
		}
		
	}

}
