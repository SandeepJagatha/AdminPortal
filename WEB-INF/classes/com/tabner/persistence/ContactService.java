package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Contact;

public interface ContactService {
	public void saveContact(Contact contact);
	public List<Contact> getContactByEid(String empid);
	public void deleteContact(String id);
	public void updateContact(Contact contact);
	public List<Contact> getAllContacts();

}
