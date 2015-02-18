package com.tabner.controllers.generatepdf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.Address;
import com.tabner.model.Clients;
import com.tabner.model.Contact;
import com.tabner.model.Employee;
import com.tabner.model.Vendor;
import com.tabner.persistence.AddressService;
import com.tabner.persistence.ClientService;
import com.tabner.persistence.ContactService;
import com.tabner.persistence.EmployeeService;
import com.tabner.persistence.VendorService;

@Controller
@RequestMapping("/generatepdf")
public class PdfController {
	private EmployeeService employeeService=null;
	private ContactService contactService=null;	
	private VendorService vendorService=null;	
	private ClientService clientService=null;	
	private AddressService addressService=null;	
	
	@Autowired
	public void setTdminService(AddressService addressService) {
		this.addressService = addressService;
	}	
	@Autowired
	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	@Autowired
	public void setTdminService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	@Autowired
	public void setVendorService(ContactService contactService) {
		this.contactService = contactService;
	}
	@Autowired
	public void setVendorService(ClientService clientService) {
		this.clientService = clientService;
	}

	@RequestMapping("/emppdf")
	public ModelAndView empToPdf() {
		ModelAndView m = new ModelAndView("empPdfView");
		List<Employee> response = employeeService.getAllEmp();
		m.getModelMap().addAttribute("emp", response);
		return m;
	}
	
	@RequestMapping("/contactspdf")
	public ModelAndView contactsToPdf() {
		ModelAndView m = new ModelAndView("contactsPdfView");
		List<Contact> response = contactService.getAllContacts();
		m.getModelMap().addAttribute("contacts", response);
		return m;
	}
	
	@RequestMapping("/vendorspdf")
	public ModelAndView vendorsToPdf() {
		ModelAndView m = new ModelAndView("vendorsPdfView");
		List<Vendor> response = vendorService.getAllVendors();
		m.getModelMap().addAttribute("vendors", response);
		return m;
	}
	
	@RequestMapping("/clientspdf")
	public ModelAndView clientsToPdf() {
		ModelAndView m = new ModelAndView("clientssPdfView");
		List<Clients> response = clientService.getAllClients();
		m.getModelMap().addAttribute("clients", response);
		return m;
	}
	
	@RequestMapping("/addresspdf")
	public ModelAndView addressToPdf() {
		ModelAndView m = new ModelAndView("addressPdfView");
		List<Address> response = addressService.getAllAddresses();
		m.getModelMap().addAttribute("addresses", response);
		return m;
	}
}
