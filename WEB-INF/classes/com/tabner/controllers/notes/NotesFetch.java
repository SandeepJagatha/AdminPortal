package com.tabner.controllers.notes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Notes;
import com.tabner.persistence.NotesService;

@Controller
@RequestMapping(value="/note")
public class NotesFetch {
	private NotesService notesService=null;	
	@Autowired
	public void setNotesService(NotesService notesService) {
		this.notesService = notesService;
	}
	
	@RequestMapping(value="fetch", method=RequestMethod.POST, params="aid")
	@ResponseBody
	public List<Notes> fetch(@RequestParam("aid") String aid, Notes notes, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return null;
		}
		else{
			List<Notes> response = notesService.getNotesByActivityId(aid);
			return response;
		}		
	}
}
