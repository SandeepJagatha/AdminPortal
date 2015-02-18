package com.tabner.controllers.vendor;

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

import com.tabner.model.Vendor;
import com.tabner.persistence.TdminService;
import com.tabner.persistence.VendorService;

@Controller
@RequestMapping(value="/vendor")
public class VendorFetch {
	private VendorService vendorService=null;	
	private TdminService tdminService=null;
	
	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	
	@RequestMapping(value="fetch", method=RequestMethod.POST, params="empid")
	@ResponseBody
	public List<Vendor> fetch(@RequestParam("empid") String empid, Vendor vendor, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Vendor> response = vendorService.getVendorByEid(empid);
			return response;
		}		
	}
	
	@RequestMapping(value="getallvendors")
	public ModelAndView vendors(@ModelAttribute(value="vendor") Vendor vendor, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
//			List<Vendor> response = vendorService.getAllVendors();
			mv.addObject("tdmin", tdminService.getTdmin(email));
//			mv.addObject("vendors", response);
			mv.setViewName("vendors");
			return mv;
		}
	}
	
	@RequestMapping(value="getallv",  method=RequestMethod.POST)
	@ResponseBody
	public List<Vendor> getallvendors( ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return null;
		}
		else{
			List<Vendor> response = vendorService.getAllVendors();
			return response;
		}
	}

}
