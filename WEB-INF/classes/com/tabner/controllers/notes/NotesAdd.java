package com.tabner.controllers.notes;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Notes;
import com.tabner.persistence.NotesService;

@Controller
@RequestMapping(value="/note")
public class NotesAdd {
	private NotesService notesService=null;	
	@Autowired
	public void setNotesService(NotesService notesService) {
		this.notesService = notesService;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Notes notes, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			notesService.saveNote(notes);
			return "Added Note successfully";
		}
		
	}

}
