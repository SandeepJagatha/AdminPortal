package com.tabner.controllers.division;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Division;
import com.tabner.persistence.DivisionService;


@Controller
@RequestMapping(value="/division")
public class DivisionUpdate {
	private DivisionService divisionService=null;	
	@Autowired
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public String update(Division division, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			divisionService.updateDivision(division);
			return "Updated Employee successfully";
		}		
	}

}
