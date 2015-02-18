package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Tdmin;

public interface TdminService {
	public void saveTdmin(Tdmin tdmin);
	public Tdmin getTdminPwd(String email);
	public void updateTdmin(Tdmin tdmin);
	public void updateTdminPwd(Tdmin tdmin);
	public void deleteTdmin(String id);
	public Tdmin getTdmin(String email);
	public Tdmin getTdminById(String id);
	public List<Tdmin> getAllTdmin();
//	boolean getTdminByLogin(String email, String password);
	//public Tdmin checkLogin(Tdmin tdmin);

}
