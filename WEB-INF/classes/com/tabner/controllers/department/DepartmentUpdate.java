package com.tabner.controllers.department;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Department;
import com.tabner.persistence.DepartmentService;

@Controller
@RequestMapping(value="/department")
public class DepartmentUpdate {
	private DepartmentService departmentService=null;	
	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	

	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public String update(Department department, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			departmentService.updateDepartment(department);
			return "Updated Employee successfully";
		}		
	}


}
