package com.tabner.controllers.division;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Division;
import com.tabner.model.Organization;
import com.tabner.persistence.DepartmentService;
import com.tabner.persistence.DivisionService;
import com.tabner.persistence.OrganizationService;


@Controller
@RequestMapping(value="/division")
public class DivisionFetch {
	private DivisionService divisionService=null;	
	private DepartmentService departmentService=null;
	private OrganizationService organizationService=null;

	@Autowired
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}
	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	@Autowired
	public void setOrgService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}	

	@RequestMapping(value="fetch", method=RequestMethod.POST, params="oid")
	@ResponseBody
	public List<Division> fetch(@RequestParam("oid") String oid, Division division, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Division> response = divisionService.getDivisionByOid(oid);
			return response;
		}		
	}
	
	@RequestMapping(value="details",method=RequestMethod.POST, params="did")
	@ResponseBody
	public ModelAndView update(@RequestParam("did") String did, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("email", email);
			Division div = divisionService.getDivisionBydid(did);
			Organization org = organizationService.getOrgById(div.getOrg_id());
			mv.addObject("org", org);
			mv.addObject("division", divisionService.getDivisionBydid(did));
			mv.addObject("departments", departmentService.getDepartmentsBydid(did));
			mv.setViewName("department");
			return mv;
		}		
	}

}
