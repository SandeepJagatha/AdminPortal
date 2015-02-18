package com.tabner.controllers.activity;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Activity;
import com.tabner.persistence.ActivityService;

@Controller
@RequestMapping(value="/activity")
public class ActivityAdd {
	private ActivityService activityService=null;	
	@Autowired
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Activity activity, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			activityService.saveActivity(activity);
			return "Added Activity successfully";
		}
		
	}

}
