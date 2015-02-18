package com.tabner.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Activity {

	private String aid;
	
	private String activity_type=null;
	private String activity_subtype=null;
	private String activity_details=null;
	
	private Date start_date=null;
	private Date end_date=null;
	private String priority=null;
	private String assign_to=null;
	private String comments=null;
	private String status;

	private String lead_id=null;
	
	private Timestamp created=null;
	private String created_by=null;
	private Timestamp last_updated=null;
	private String last_updated_by=null;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public String getActivity_subtype() {
		return activity_subtype;
	}
	public void setActivity_subtype(String activity_subtype) {
		this.activity_subtype = activity_subtype;
	}
	public String getActivity_details() {
		return activity_details;
	}
	public void setActivity_details(String activity_details) {
		this.activity_details = activity_details;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date date) {
		this.end_date = date;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getAssign_to() {
		return assign_to;
	}
	public void setAssign_to(String assign_to) {
		this.assign_to = assign_to;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLead_id() {
		return lead_id;
	}
	public void setLead_id(String lead_id) {
		this.lead_id = lead_id;
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
