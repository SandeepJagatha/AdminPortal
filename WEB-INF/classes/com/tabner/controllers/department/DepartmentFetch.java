package com.tabner.controllers.department;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Department;
import com.tabner.model.Division;
import com.tabner.model.Organization;
import com.tabner.persistence.DepartmentService;

@Controller
@RequestMapping(value="/department")
public class DepartmentFetch {
	private DepartmentService departmentService=null;	
	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	@RequestMapping(value="fetch", method=RequestMethod.POST, params="did")
	@ResponseBody
	public List<Department> fetch(@RequestParam("did") String did, Department department, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Department> response = departmentService.getDepartmentsBydid(did);
			return response;
		}		
	}

	
	@RequestMapping(value="details",method=RequestMethod.POST, params="did")
	public ModelAndView update(@RequestParam("did") String did, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			System.out.println(did);
			request.getSession().setAttribute("deptID", did);
			return new ModelAndView("redirect:/employee/employees");
		}		
	}

}
