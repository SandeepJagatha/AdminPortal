package com.tabner.controllers.address;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.AddressService;

@Controller
@RequestMapping(value="/address")
public class AddressDelete {
	private AddressService addressService=null;	
	@Autowired
	public void setTdminService(AddressService addressService) {
		this.addressService = addressService;
	}
	
	@RequestMapping(value="delete",method=RequestMethod.POST, params="aid")
	@ResponseBody
	public String delete(@RequestParam("aid") String aid, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			addressService.deleteAddress(aid);
			return "deleted address successfully";
		}
		
	}
	

}
