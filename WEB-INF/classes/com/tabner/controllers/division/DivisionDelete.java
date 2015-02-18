package com.tabner.controllers.division;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.DivisionService;


@Controller
@RequestMapping(value="/division")
public class DivisionDelete {
	private DivisionService divisionService=null;	
	@Autowired
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST, params="did")
	@ResponseBody
	public String delete(@RequestParam("did") String did, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			divisionService.deleteDivision(did);
			return "Deleted Division successfully";
		}
		
	}

}
