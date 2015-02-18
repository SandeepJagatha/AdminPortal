package com.tabner.controllers.lead;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Lead;
import com.tabner.persistence.LeadService;

@Controller
@RequestMapping(value="lead")
public class LeadUpdate {
	private LeadService leadService=null;
	@Autowired
	public void setLeadService(LeadService leadService) {
		this.leadService = leadService;
	}
	

	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public String update(Lead lead, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			leadService.updateLead(lead);
			return "Updated Employee successfully";
		}		
	}

}
