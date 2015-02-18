package com.tabner.controllers.organization;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Organization;
import com.tabner.model.Tdmin;
import com.tabner.persistence.OrganizationService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/org")
public class OrganizationAdd {
	private TdminService tdminService=null;
	private OrganizationService organizationService=null;
	
	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setOrgService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Organization org, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){;
			return "login";
		}else{
			
			organizationService.saveOrg(org);
			return "Added Org successfully";
		}	
	}
	
	@RequestMapping(value="/view")
	public ModelAndView org(@ModelAttribute(value="org") Organization org, @ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			System.out.println( email);
			mv.addObject("email", email);
			mv.addObject("tdmin", tdminService.getTdmin(email));
			List<Organization> orglist = organizationService.getAllOrgs();
			mv.addObject("orgs", orglist);
			mv.setViewName("org");
			return mv;
		}
	}
}
