package com.tabner.controllers.contact;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.ContactService;

@Controller
@RequestMapping(value="/contact/delete")
public class ContactDelete {
	
	private ContactService contactService=null;	
	@Autowired
	public void setVendorService(ContactService contactService) {
		this.contactService = contactService;
	}
	
	@RequestMapping(method=RequestMethod.POST, params="cid")
	@ResponseBody
	public String delete(@RequestParam("cid") String cid, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			contactService.deleteContact(cid);
			return "deleted selected contact successfully";
		}
		
	}


}
