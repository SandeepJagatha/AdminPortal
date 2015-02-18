package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Organization;

public interface OrganizationService {
	public void saveOrg(Organization organization);
	public void deleteOrg(String id);
	public List<Organization> getAllOrgs();
	public void updateOrg(Organization organization);
	public Organization getOrgById(String oid);

}
