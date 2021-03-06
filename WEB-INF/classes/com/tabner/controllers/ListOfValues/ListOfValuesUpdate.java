package com.tabner.controllers.ListOfValues;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.ListOfValues;
import com.tabner.persistence.ListOfValuesService;

@Controller
@RequestMapping(value="/settings")
public class ListOfValuesUpdate {

	private ListOfValuesService listofvaluesService=null;	
	@Autowired
	public void setListOfValuesService(ListOfValuesService listofvaluesService) {
		this.listofvaluesService = listofvaluesService;
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public String update(ListOfValues lv, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			List<ListOfValues> allList = listofvaluesService.getListOfValues();
//			for (ListOfValues e : allList) {
//				if(e.getList_value().toLowerCase().equals(lv.getList_value().toLowerCase()) && e.getList_seq().equals(lv.getList_seq())){
//					return "This Combination already exist";
//				}
//			}
			listofvaluesService.updateListOfValues(lv);;
			return "Updated List successfully";
		}		
	}

}
