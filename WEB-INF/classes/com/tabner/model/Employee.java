package com.tabner.model;

public class Employee {
	
	private String eid;
	private String first_name=null;
	private String middle_name=null;
	private String last_name=null;
	private String job_title=null;
	private String org_id=null;
	private String div_id=null;
	private String department_id=null;
	private String email_work=null;
	private String email_personal=null;
	private String home_ph_num=null;
	private String work_ph_num=null;
	private String cell_ph_num=null;
	private String SSN=null;
	private String DOB=null;
	private String date_of_joining=null;
	private String date_of_ending=null;
	private String country_of_birth=null;
	private String emp_status=null;
	private String created=null;
	private String created_by=null;
	private String last_updated=null;
	private String last_updated_by=null;
	private String active_flag=null;
	private String terminated_flag=null;
	
	
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

	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getDiv_id() {
		return div_id;
	}
	public void setDiv_id(String div_id) {
		this.div_id = div_id;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}

	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
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
	public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getDate_of_joining() {
		return date_of_joining;
	}
	public void setDate_of_joining(String date_of_joining) {
		this.date_of_joining = date_of_joining;
	}
	public String getDate_of_ending() {
		return date_of_ending;
	}
	public void setDate_of_ending(String date_of_ending) {
		this.date_of_ending = date_of_ending;
	}
	public String getCountry_of_birth() {
		return country_of_birth;
	}
	public void setCountry_of_birth(String country_of_birth) {
		this.country_of_birth = country_of_birth;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getEmp_status() {
		return emp_status;
	}
	public void setEmp_status(String emp_status) {
		this.emp_status = emp_status;
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
	public void setLast_updated_by(String last_update_by) {
		this.last_updated_by = last_update_by;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public String getTerminated_flag() {
		return terminated_flag;
	}
	public void setTerminated_flag(String terminated_flag) {
		this.terminated_flag = terminated_flag;
	}
	
	@Override
	public String toString() {
		return "Employee [first_name=" + first_name
				+ ", middle_name=" + middle_name + ", last_name=" + last_name
				+ ", job_title=" + job_title + ", email_work=" + email_work
				+ ", email_personal=" + email_personal + ", home_ph_num="
				+ home_ph_num + ", work_ph_num=" + work_ph_num
				+ ", cell_ph_num=" + cell_ph_num + ", SSN=" + SSN + ", DOB="
				+ DOB + ", date_of_joining=" + date_of_joining
				+ ", date_of_ending=" + date_of_ending + ", country_of_birth="
				+ country_of_birth + ", eid=" + eid + ", emp_status="
				+ emp_status + ", created=" + created + ", created_by="
				+ created_by + ", last_updated=" + last_updated
				+ ", last_update_by=" + last_updated_by + ", active_flag="
				+ active_flag + ", terminated_flag=" + terminated_flag + "]";
	}
	

}
