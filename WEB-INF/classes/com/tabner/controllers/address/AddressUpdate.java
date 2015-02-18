package com.tabner.controllers.address;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Address;
import com.tabner.persistence.AddressService;

@Controller
@RequestMapping(value="/address")
public class AddressUpdate {
	private AddressService addressService=null;	
	@Autowired
	public void setTdminService(AddressService addressService) {
		this.addressService = addressService;
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	@ResponseBody
	public String update(Address address, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			addressService.updateAddress(address);
			return "updated Employee successfully";
		}		
	}

}
