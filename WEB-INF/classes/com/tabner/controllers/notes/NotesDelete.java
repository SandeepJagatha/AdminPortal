package com.tabner.controllers.notes;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.persistence.NotesService;

@Controller
@RequestMapping(value="/note")
public class NotesDelete {
	private NotesService notesService=null;	
	@Autowired
	public void setNotesService(NotesService notesService) {
		this.notesService = notesService;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST, params="id")
	@ResponseBody
	public String delete(@RequestParam("id") String id, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			notesService.deleteNote(id);
			return "Deleted Note successfully";
		}		
	}
}
