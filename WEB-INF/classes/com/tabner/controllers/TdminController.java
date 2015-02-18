package com.tabner.controllers;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;  
import org.springframework.security.providers.encoding.PasswordEncoder;*/




import com.tabner.model.Tdmin;
import com.tabner.persistence.TdminService;

@Controller
@RequestMapping(value="/tdmin")
/*@SessionAttributes("tdminobj")*/
public class TdminController {
	private TdminService tdminService=null;
	
	@Autowired
	public void setTdminService(TdminService tdminService) {
		this.tdminService = tdminService;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String showLoginForm(ModelMap model){
		return "login";
	}
	
/*	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session, HttpServletRequest request){
		session.invalidate();
		return "login";
	}*/
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView logincheck(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mav, HttpServletRequest request){
		
		Tdmin t1 = tdminService.getTdminPwd(tdmin.getEmail());
		//System.out.println("encodedpwd"+t1.getPassword());
		
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		boolean result = passwordEncoder.matches(tdmin.getPassword(), t1.getPassword());
		//System.out.println(result);
		
		//if(tdminService.checkLogin(tdmin)==null){
		if(result==false){
			/*model.addAttribute("message", "The email or password you entered is incorrect ");*/
			mav.setViewName("login");
			mav.addObject("message",  "The email or password you entered is incorrect ");
			return mav;
		}
		else{

			request.getSession().setAttribute("email", tdmin.getEmail());
		    /*mav.addObject("tdminobj", tdminService.checkLogin(tdmin));*/
//		    return new ModelAndView("redirect:/org/view");

		    return new ModelAndView("redirect:/tdmin/index");
			/*return "redirect:/tdmin/index";*/
//			mav.setViewName("org");
//			return mav;
		}
	}

	@RequestMapping(value="/index")
	public ModelAndView home(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.setViewName("index");
			return mv;
		}
	}
	
	@RequestMapping(value="/manageusers", method=RequestMethod.GET)
	public ModelAndView ManagaUsers(@ModelAttribute(value="tdmin") Tdmin tdmin, ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}
		else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.addObject("tdmins", tdminService.getAllTdmin());
			System.out.println(tdminService.getAllTdmin());
			mv.setViewName("manageusers");
			return mv;
		}
		
	}

	@RequestMapping(value="/fetch", method=RequestMethod.GET)
	@ResponseBody
	public List<Tdmin> fetch(Tdmin tdmin) {
		List<Tdmin> response = tdminService.getAllTdmin();
		return response;
	}
	
		
	@RequestMapping(value="/pwdreset", method=RequestMethod.GET)
	public ModelAndView pwdResetForm(ModelMap model,  ModelAndView mv, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			mv.setViewName("login");
			return mv;
		}else{
			mv.addObject("tdmin", tdminService.getTdmin(email));
			mv.setViewName("pwdreset");
			return mv;
			//return new ModelAndView("redirect:/tdmin/index");
		}		
	}
	
	@RequestMapping(value="/pwdreset", method=RequestMethod.POST)
	public String pwdReset(Tdmin tdmin, HttpServletRequest request, Model model){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}else{
			//System.out.println(tdmin.getPassword());
			
			//Password encryption code
			String password = tdmin.getPassword();
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);		
			
			//System.out.println(hashedPassword);
			//System.out.println(tdmin);
			tdmin.setPassword(hashedPassword);
			//System.out.println(tdmin);
			tdminService.updateTdminPwd(tdmin);
			model.addAttribute("tdmin", tdminService.getTdmin(email));
			return "index";
		}		
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Tdmin tdmin, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){;
			return "login";
		}else{
			//System.out.println(tdmin.getPassword());
			
			//Password encryption code
			String password = tdmin.getPassword();
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);		
			
			//System.out.println(hashedPassword);
			//System.out.println(tdmin);
			tdmin.setPassword(hashedPassword);
			//System.out.println(tdmin);
			tdminService.saveTdmin(tdmin);
			return "Added tabner user successfully";
		}	
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST, params="tid")
	@ResponseBody
	public String delete(@RequestParam("tid") String id, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}else{
			tdminService.deleteTdmin(id);
			return "deleted user successfully";
		}		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public String edit(Tdmin tdmin, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}else{
			tdminService.updateTdmin(tdmin);
			return "updated user successfully";
		}			
	}
	
	/*@RequestMapping(value="/add", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Tdmin add(@RequestBody Tdmin tdmin,HttpServletRequest request) {
		System.out.println(tdmin);
		tdminService.saveTdmin(tdmin);
		return (Tdmin) tdminService.getAllTdmin();
	}*/

}
