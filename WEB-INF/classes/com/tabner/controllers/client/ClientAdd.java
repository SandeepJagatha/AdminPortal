package com.tabner.controllers.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Clients;
import com.tabner.persistence.ClientService;


@Controller
@RequestMapping(value="/client")
public class ClientAdd {
	private ClientService clientService=null;	
	@Autowired
	public void setVendorService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Clients client, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			System.out.println(client);
			clientService.saveClient(client);
			return "Added successfully";
		}
	}
}
