package com.tabner.controllers.department;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.DepartmentService;

@Controller
@RequestMapping(value="/department")
public class DepartmentDelete {
	private DepartmentService departmentService=null;	
	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	@RequestMapping(value="delete", method=RequestMethod.POST, params="did")
	@ResponseBody
	public String delete(@RequestParam("did") String id, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			departmentService.deleteDepartment(id);
			return "Deleted Division successfully";
		}
		
	}

}
