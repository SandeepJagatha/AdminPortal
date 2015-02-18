package com.tabner.controllers.organization;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Organization;
import com.tabner.persistence.DivisionService;
import com.tabner.persistence.OrganizationService;

@Controller
@RequestMapping(value="/org")
public class OrganizationFetch {

	private DivisionService divisionService=null;
	private OrganizationService organizationService=null;
	

	@Autowired
	public void setOrgService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	@Autowired
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}
	

	@RequestMapping(value="details",method=RequestMethod.POST, params="oid")
	@ResponseBody
	public ModelAndView update(@RequestParam("oid") String oid, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("email", email);
			mv.addObject("divisions", divisionService.getDivisionByOid(oid));
			mv.addObject("orgs", organizationService.getOrgById(oid));
			mv.setViewName("division");
			return mv;
		}		
	}
	

	@RequestMapping(value="fetch", method=RequestMethod.GET)
	@ResponseBody
	public List<Organization> fetch(Organization organization, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Organization> response = organizationService.getAllOrgs();
			return response;
		}		
	}
	

}
