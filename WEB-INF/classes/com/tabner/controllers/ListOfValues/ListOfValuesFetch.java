package com.tabner.controllers.ListOfValues;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tabner.model.ListOfValues;
import com.tabner.model.Tdmin;
import com.tabner.persistence.ListOfValuesService;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/settings")
public class ListOfValuesFetch {

	private ListOfValuesService listofvaluesService=null;	
	private TdminService tdminService=null;	

	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	@Autowired
	public void setListOfValuesService(ListOfValuesService listofvaluesService) {
		this.listofvaluesService = listofvaluesService;
	}

	@RequestMapping(value="fetch", method=RequestMethod.POST)
	@ResponseBody
	public List<ListOfValues> fetch(ListOfValues listofvalues, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<ListOfValues> response = listofvaluesService.getListOfValues();
			return response;
		}		
	}
	@RequestMapping(value="listofvalues", method=RequestMethod.GET)
	public ModelAndView showLoginForm(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.addObject("leads", listofvaluesService.getListOfValues());
			mv.setViewName("listofvalues");
			return mv;
		}
	}
}
