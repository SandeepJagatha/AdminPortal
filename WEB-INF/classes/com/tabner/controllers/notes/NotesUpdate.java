package com.tabner.controllers.notes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tabner.persistence.NotesService;

@Controller
@RequestMapping(value="/note")
public class NotesUpdate {
	private NotesService notesService=null;	
	@Autowired
	public void setNotesService(NotesService notesService) {
		this.notesService = notesService;
	}
}
