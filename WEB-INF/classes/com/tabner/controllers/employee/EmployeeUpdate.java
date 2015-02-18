package com.tabner.controllers.employee;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Employee;
import com.tabner.persistence.EmployeeService;

@Controller
@RequestMapping(value="/employee")
public class EmployeeUpdate {
	private EmployeeService employeeService=null;	
	@Autowired
	public void setTdminService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public String update(Employee employee, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			employeeService.updateEmp(employee);
			return "Updated Employee successfully";
		}		
	}

}
