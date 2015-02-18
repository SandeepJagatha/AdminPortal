package com.tabner.controllers.client;

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

import com.tabner.model.Clients;
import com.tabner.persistence.ClientService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/client")
public class ClientFetch {
	private ClientService clientService=null;	
	private TdminService tdminService=null;
	
	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setVendorService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value="fetch",method=RequestMethod.POST, params="empid")
	@ResponseBody
	public List<Clients> fetch(@RequestParam("empid") String empid, Clients client, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Clients> response = clientService.getClientByEid(empid);
			return response;
		}		
	}
	
	@RequestMapping(value="getallclients")
	public ModelAndView home(@ModelAttribute(value="clients") Clients client, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			//List<Contact> response = contactService.getAllContacts();
			mv.addObject("tdmin", tdminService.getTdmin(email));
			//mv.addObject("contacts", response);
			mv.setViewName("clients");
			return mv;
		}
	}
	
	@RequestMapping(value="getallclients", method=RequestMethod.POST)
	@ResponseBody
	public List<Clients> GetAllContacts(Clients client, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			//System.out.println(contact);
			List<Clients> response = clientService.getAllClients();
			return response;
		}
	}

}
