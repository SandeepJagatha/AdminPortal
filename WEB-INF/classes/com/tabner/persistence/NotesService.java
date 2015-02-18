package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Notes;

public interface NotesService {
	public void saveNote(Notes notes);
	public List<Notes> getAllNotes();
	public void deleteNote(String id);
	public void updateNote(Notes notes);
	public Notes getNoteById(String id);
	public List<Notes> getNotesByActivityId(String aid);

}
