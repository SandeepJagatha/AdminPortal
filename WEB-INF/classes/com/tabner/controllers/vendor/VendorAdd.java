package com.tabner.controllers.vendor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Vendor;
import com.tabner.persistence.VendorService;


@Controller
@RequestMapping(value="/vendor")
public class VendorAdd {
	
	private VendorService vendorService=null;	
	@Autowired
	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Vendor vendor, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			System.out.println(vendor);
			vendorService.saveVendor(vendor);
			return "Added successfully";
		}
		
	}

}
