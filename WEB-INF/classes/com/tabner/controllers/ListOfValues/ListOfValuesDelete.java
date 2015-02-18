package com.tabner.controllers.ListOfValues;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.ListOfValuesService;

@Controller
@RequestMapping(value="/settings")
public class ListOfValuesDelete {

	private ListOfValuesService listofvaluesService=null;	
	@Autowired
	public void setListOfValuesService(ListOfValuesService listofvaluesService) {
		this.listofvaluesService = listofvaluesService;
	}

	@RequestMapping(value="delete", method=RequestMethod.POST, params="id")
	@ResponseBody
	public String delete(@RequestParam("id") int id, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			listofvaluesService.deleteListOfValues(id);
			return "Deleted ListOfValue successfully";
		}
		
	}


}
