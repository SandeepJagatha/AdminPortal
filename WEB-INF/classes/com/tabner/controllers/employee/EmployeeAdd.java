package com.tabner.controllers.employee;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Employee;
import com.tabner.model.Tdmin;
import com.tabner.persistence.EmployeeService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/employee")
public class EmployeeAdd {
	private EmployeeService employeeService=null;
	@Autowired
	public void setTdminService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@RequestMapping(value="addEmployee", method=RequestMethod.POST)
	@ResponseBody
	public String add(Employee employee, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			//System.out.println(employee);
			employeeService.saveEmp(employee);
			return "Added successfully";
		}
		
	}

}
