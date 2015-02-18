package com.tabner.controllers.contact;

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

import com.tabner.model.Contact;
import com.tabner.persistence.ContactService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/contact")
public class ContactFetch {
	private ContactService contactService=null;	
	private TdminService tdminService=null;
	
	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setVendorService(ContactService contactService) {
		this.contactService = contactService;
	}
	
	@RequestMapping(value="fetch",method=RequestMethod.POST, params="empid")
	@ResponseBody
	public List<Contact> fetch(@RequestParam("empid") String empid, Contact contact, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Contact> response = contactService.getContactByEid(empid);
			return response;
		}		
	}
	
	@RequestMapping(value="getallcontacts")
	public ModelAndView home(@ModelAttribute(value="contacts") Contact contact, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			//List<Contact> response = contactService.getAllContacts();
			mv.addObject("tdmin", tdminService.getTdmin(email));
			//mv.addObject("contacts", response);
			mv.setViewName("contacts");
			return mv;
		}
	}
	
	@RequestMapping(value="getallcontacts", method=RequestMethod.POST)
	@ResponseBody
	public List<Contact> GetAllContacts(Contact contact, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			System.out.println(contact);
			List<Contact> response = contactService.getAllContacts();
			return response;
		}
	}

}
