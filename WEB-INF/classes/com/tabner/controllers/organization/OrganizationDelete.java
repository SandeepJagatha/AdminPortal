package com.tabner.controllers.organization;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.OrganizationService;

@Controller
@RequestMapping(value="/org")
public class OrganizationDelete {

	private OrganizationService organizationService=null;	
	@Autowired
	public void setOrgService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST, params="oid")
	@ResponseBody
	public String delete(@RequestParam("oid") String oid, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			organizationService.deleteOrg(oid);
			return "Deleted Organization successfully";
		}
		
	}

}
