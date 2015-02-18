package com.tabner.controllers.address;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Address;
import com.tabner.persistence.AddressService;

@Controller
@RequestMapping(value="/address")
public class AddressFetch {
	private AddressService addressService=null;	
	@Autowired
	public void setTdminService(AddressService addressService) {
		this.addressService = addressService;
	}

	@RequestMapping(value="fetch",method=RequestMethod.POST, params="empid")
	@ResponseBody
	public List<Address> fetch(@RequestParam("empid") String empid, Address address, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Address> response = addressService.getAddrByEid(empid);
			return response;
		}		
	}
	
	@RequestMapping(value="getalladdresses", method=RequestMethod.POST)
	@ResponseBody
	public List<Address> GetAllAddress(Address address, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			//System.out.println(contact);
			List<Address> response = addressService.getAllAddresses();
			return response;
		}
	}

}
