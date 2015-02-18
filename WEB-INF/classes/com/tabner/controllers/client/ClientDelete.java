package com.tabner.controllers.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.ClientService;

@Controller
@RequestMapping(value="/client")
public class ClientDelete {
	private ClientService clientService=null;	
	@Autowired
	public void setVendorService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value="delete",method=RequestMethod.POST, params="clientid")
	@ResponseBody
	public String delete(@RequestParam("clientid") String clientid, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			clientService.deleteClient(clientid);
			return "Deleted selected client successfully";
		}		
	}
}
