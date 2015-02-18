package com.tabner.controllers.employee;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Employee;
import com.tabner.persistence.EmployeeService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/employee")
public class EmployeeDelete {
	
	private EmployeeService employeeService=null;
	
	@Autowired
	public void setTdminService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
		
	@RequestMapping(value="delete", method=RequestMethod.POST, params="id")
	@ResponseBody
	public String delete(@RequestParam("id") String id, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			System.out.println(id);
			employeeService.deleteEmp(id);
			return "Deleted Employee successfully";
		}
		
	}

}
