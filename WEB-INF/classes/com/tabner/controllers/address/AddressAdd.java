package com.tabner.controllers.address;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Address;
import com.tabner.persistence.AddressService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/address")
public class AddressAdd {
	
	private AddressService addressService=null;	
	@Autowired
	public void setTdminService(AddressService addressService) {
		this.addressService = addressService;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Address address, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			System.out.println(address);
			addressService.saveAddress(address);
			return "Added successfully";
		}
		
	}

}
