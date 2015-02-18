package com.tabner.model;

public class Vendor {
	private String id;
	private String par_row_id=null;	
	private String vname=null;
	private String contact_person=null;
	private String ph_num_primary=null;
	private String ph_num_secondary=null;
	private String email_addr=null;
	private String website=null;
	private String payment_term=null;
	private String created=null;
	private String created_by=null;
	private String last_updated=null;
	private String last_updated_by=null;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPar_row_id() {
		return par_row_id;
	}
	public void setPar_row_id(String par_row_id) {
		this.par_row_id = par_row_id;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getContact_person() {
		return contact_person;
	}
	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}
	public String getPh_num_primary() {
		return ph_num_primary;
	}
	public void setPh_num_primary(String ph_num_primary) {
		this.ph_num_primary = ph_num_primary;
	}
	public String getPh_num_secondary() {
		return ph_num_secondary;
	}
	public void setPh_num_secondary(String ph_num_secondary) {
		this.ph_num_secondary = ph_num_secondary;
	}
	public String getEmail_addr() {
		return email_addr;
	}
	public void setEmail_addr(String email_addr) {
		this.email_addr = email_addr;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getPayment_term() {
		return payment_term;
	}
	public void setPayment_term(String payment_term) {
		this.payment_term = payment_term;
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
