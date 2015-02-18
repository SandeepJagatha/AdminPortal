package com.tabner.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Lead {	
	private String lid;
	
	private String first_name;
	private String middle_name;
	private String last_name;
	
	private String technology;
	private String ltype;
	private String cur_designation;
	private String cur_sal;
	private String cur_org;
	private String cur_status;

	private String cur_emp_type;
	private String expected_sal;
	private String gender;
	private String marital_status;
	private String applied_for;
	private String assign_to;
	
	private String exp;
	private String channel;
	private String c_name;
	private String loc_constraint;
	private String loc_state;
	private String loc_city;
	private String home_ph_num;
	private String work_ph_num;
	private String cell_ph_num;
	private String email_work;
	private String email_personal;
	
	private Timestamp created;
	private String created_by;
	private Timestamp last_updated;
	private String last_updated_by;
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLoc_constraint() {
		return loc_constraint;
	}
	public void setLoc_constraint(String loc_constraint) {
		this.loc_constraint = loc_constraint;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public String getLtype() {
		return ltype;
	}
	public void setLtype(String ltype) {
		this.ltype = ltype;
	}
	public String getCur_designation() {
		return cur_designation;
	}
	public void setCur_designation(String cur_designation) {
		this.cur_designation = cur_designation;
	}
	public String getCur_sal() {
		return cur_sal;
	}
	public void setCur_sal(String cur_sal) {
		this.cur_sal = cur_sal;
	}
	public String getCur_org() {
		return cur_org;
	}
	public void setCur_org(String cur_org) {
		this.cur_org = cur_org;
	}
	public String getCur_status() {
		return cur_status;
	}
	public void setCur_status(String cur_status) {
		this.cur_status = cur_status;
	}
	public String getCur_emp_type() {
		return cur_emp_type;
	}
	public void setCur_emp_type(String cur_emp_type) {
		this.cur_emp_type = cur_emp_type;
	}
	public String getExpected_sal() {
		return expected_sal;
	}
	public void setExpected_sal(String expected_sal) {
		this.expected_sal = expected_sal;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getApplied_for() {
		return applied_for;
	}
	public void setApplied_for(String applied_for) {
		this.applied_for = applied_for;
	}
	public String getAssign_to() {
		return assign_to;
	}
	public void setAssign_to(String assign_to) {
		this.assign_to = assign_to;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getLoc_state() {
		return loc_state;
	}
	public void setLoc_state(String loc_state) {
		this.loc_state = loc_state;
	}
	public String getLoc_city() {
		return loc_city;
	}
	public void setLoc_city(String loc_city) {
		this.loc_city = loc_city;
	}
	public String getHome_ph_num() {
		return home_ph_num;
	}
	public void setHome_ph_num(String home_ph_num) {
		this.home_ph_num = home_ph_num;
	}
	public String getWork_ph_num() {
		return work_ph_num;
	}
	public void setWork_ph_num(String work_ph_num) {
		this.work_ph_num = work_ph_num;
	}
	public String getCell_ph_num() {
		return cell_ph_num;
	}
	public void setCell_ph_num(String cell_ph_num) {
		this.cell_ph_num = cell_ph_num;
	}
	public String getEmail_work() {
		return email_work;
	}
	public void setEmail_work(String email_work) {
		this.email_work = email_work;
	}
	public String getEmail_personal() {
		return email_personal;
	}
	public void setEmail_personal(String email_personal) {
		this.email_personal = email_personal;
	}
	public Timestamp getCreated() {
		return created;
	}
	public void setCreated(Timestamp created) {
		this.created = created;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Timestamp getLast_updated() {
		return last_updated;
	}
	public void setLast_updated(Timestamp last_updated) {
		this.last_updated = last_updated;
	}
	public String getLast_updated_by() {
		return last_updated_by;
	}
	public void setLast_updated_by(String last_updated_by) {
		this.last_updated_by = last_updated_by;
	}
	
}
