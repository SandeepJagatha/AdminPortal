package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Lead;

public interface LeadService {
	public int saveLead(Lead lead);
	public List<Lead> getAllLeads();
	public void deleteLead(String id);
	public void updateLead(Lead lead);
	public Lead getLeadById(String id);
	//int insertSelective(Lead record);
}
