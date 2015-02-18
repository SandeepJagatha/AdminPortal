package com.tabner.model;

import java.sql.Timestamp;

public class ListOfValues {
	private String id;	
	private String list_type;
	private String list_value;
	private String list_seq;
	private String list_subvalue;
	private String active_flag;
	private String created;
	private String created_by;
	private String last_updated;
	private String last_updated_by;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getList_type() {
		return list_type;
	}
	public void setList_type(String list_type) {
		this.list_type = list_type;
	}
	public String getList_value() {
		return list_value;
	}
	public void setList_value(String list_value) {
		this.list_value = list_value;
	}
	public String getList_seq() {
		return list_seq;
	}
	public void setList_seq(String list_seq) {
		this.list_seq = list_seq;
	}
	public String getList_subvalue() {
		return list_subvalue;
	}
	public void setList_subvalue(String list_subvalue) {
		this.list_subvalue = list_subvalue;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getLast_updated() {
		return last_updated;
	}
	public void setLast_updated(String last_updated) {
		this.last_updated = last_updated;
	}
	public String getLast_updated_by() {
		return last_updated_by;
	}
	public void setLast_updated_by(String last_updated_by) {
		this.last_updated_by = last_updated_by;
	}
	

}
