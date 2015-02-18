package com.tabner.model;

import java.sql.Timestamp;

public class Attachment {
	private String id;	
	private String attachement_type=null;
	private String attachement_details=null;
	private String attachement=null;
	private String activity_id=null;
	private Timestamp created;
	private String created_by;
	private Timestamp last_updated;
	private String last_updated_by;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAttachement_type() {
		return attachement_type;
	}
	public void setAttachement_type(String attachement_type) {
		this.attachement_type = attachement_type;
	}
	public String getAttachement_details() {
		return attachement_details;
	}
	public void setAttachement_details(String attachement_details) {
		this.attachement_details = attachement_details;
	}
	public String getAttachement() {
		return attachement;
	}
	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}
	public String getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(String activity_id) {
		this.activity_id = activity_id;
	}	

}
