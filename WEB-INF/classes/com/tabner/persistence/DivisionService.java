package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Division;

public interface DivisionService {
	public void saveDivision(Division division);
	public void deleteDivision(String id);
	public List<Division> getAllDivisions();
	public void updateDivision(Division division);
	public List<Division> getDivisionByOid(String oid);
	public Division getDivisionBydid(String did);

}
