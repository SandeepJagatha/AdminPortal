package com.tabner.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/logout")
public class Logout {
	@RequestMapping(method=RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session, HttpServletRequest request){
		session.invalidate();
		return "login";
	}

}
