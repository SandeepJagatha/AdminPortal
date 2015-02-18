package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Clients;

public interface ClientService {
	public void saveClient(Clients client);
	public List<Clients> getClientByEid(String empid);
	public void deleteClient(String id);
	public void updateClient(Clients client);
	public List<Clients> getAllClients();
}
