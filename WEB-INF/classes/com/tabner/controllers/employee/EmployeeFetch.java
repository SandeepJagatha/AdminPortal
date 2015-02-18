package com.tabner.controllers.employee;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Address;
import com.tabner.model.Clients;
import com.tabner.model.Contact;
import com.tabner.model.Employee;
import com.tabner.model.Tdmin;
import com.tabner.model.Vendor;
import com.tabner.persistence.AddressService;
import com.tabner.persistence.ClientService;
import com.tabner.persistence.ContactService;
import com.tabner.persistence.EmployeeService;
import com.tabner.persistence.TdminService;
import com.tabner.persistence.VendorService;

@Controller
@RequestMapping(value="/employee")
public class EmployeeFetch {

	private EmployeeService employeeService=null;
	private AddressService addressService=null;
	private VendorService vendorService=null;
	private ContactService contactService=null;
	private ClientService clientService=null;
	private TdminService tdminService=null;	

	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setEmpService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	@Autowired
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	@Autowired
	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	@Autowired
	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}
	@Autowired
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@RequestMapping(value="fetch", method=RequestMethod.POST)
	@ResponseBody
	public List<Employee> fetch(Employee employee, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Employee> response = employeeService.getAllEmp();
			return response;
		}		
	}
	
	@RequestMapping(value="employees", method=RequestMethod.GET)
	public ModelAndView showLoginForm(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.addObject("employees", employeeService.getAllEmp());
			//System.out.println(employeeService.getAllEmp());
			mv.setViewName("employee");
			return mv;
		}
	}
	
	
	@RequestMapping(value="details",method=RequestMethod.POST, params="empid")
	@ResponseBody
	public ModelAndView update(@RequestParam("empid") String empid, ModelAndView mv,HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("email", email);
			mv.addObject("employee", employeeService.getEmpById(empid));
			//System.out.println(empid);
			List<Address> addresslist = addressService.getAddrByEid(empid);
			List<Vendor> vendorlist = vendorService.getVendorByEid(empid);
			List<Contact> contactlist = contactService.getContactByEid(empid);
			List<Clients> clientlist = clientService.getClientByEid(empid);
			//System.out.println(addressService.getAddrByEid(empid));
			mv.addObject("address", addresslist);
			mv.addObject("vendors", vendorlist);
			mv.addObject("contacts", contactlist);
			mv.addObject("clients", clientlist);
			mv.setViewName("emp_details");
			return mv;
		}		
	}
	
	
	
	
	

}
