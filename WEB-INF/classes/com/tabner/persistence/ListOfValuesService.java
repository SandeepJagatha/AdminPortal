package com.tabner.persistence;

import java.util.List;

import com.tabner.model.ListOfValues;;

public interface ListOfValuesService {

	public void saveListOfValues(ListOfValues listofvalues);
	public List<ListOfValues> getListOfValues();
	public void deleteListOfValues(int id);
	public void updateListOfValues(ListOfValues listofvalues);
	public ListOfValues getListOfValuesById(String id);
	public List<ListOfValues> getListOfValuesByListType(String list_type);

}
