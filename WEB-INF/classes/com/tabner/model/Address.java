package com.tabner.model;

public class Address {
	private String id;
	private String par_row_id=null;
	private String addr_type=null;
	private String addr_line1=null;
	private String addr_line2=null;
	private String addr_line3=null;
	private String city=null;
	private String state=null;
	private String country=null;
	private String county=null;
	private String district=null;
	private String zipcode=null;
	private String zipcode_ext=null;
	private String time_zone_cd=null;
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
	public String getAddr_type() {
		return addr_type;
	}
	public void setAddr_type(String addr_type) {
		this.addr_type = addr_type;
	}
	public String getAddr_line1() {
		return addr_line1;
	}
	public void setAddr_line1(String addr_line1) {
		this.addr_line1 = addr_line1;
	}
	public String getAddr_line2() {
		return addr_line2;
	}
	public void setAddr_line2(String addr_line2) {
		this.addr_line2 = addr_line2;
	}
	public String getAddr_line3() {
		return addr_line3;
	}
	public void setAddr_line3(String addr_line3) {
		this.addr_line3 = addr_line3;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTime_zone_cd() {
		return time_zone_cd;
	}
	public void setTime_zone_cd(String time_zone_cd) {
		this.time_zone_cd = time_zone_cd;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getZipcode_ext() {
		return zipcode_ext;
	}
	public void setZipcode_ext(String zipcode_ext) {
		this.zipcode_ext = zipcode_ext;
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
