package com.tabner.model;

public class Tdmin{

	private String id;
	private String email=null;
	private String password=null;
	private String firstname=null;
	private String lastname=null;
	private String is_admin=null;
	private String cell_ph_num=null;
	
	public String getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getCell_ph_num1() {
		return cell_ph_num;
	}
	public void setCell_ph_num1(String cell_ph_num) {
		this.cell_ph_num = cell_ph_num;
	}
	public String getCell_ph_num() {
		return cell_ph_num;
	}
	public void setCell_ph_num(String cell_ph_num) {
		this.cell_ph_num = cell_ph_num;
	}
	
	@Override
	public String toString() {
		return "Tdmin [id=" + id + ", email=" + email + ", password="
				+ password + ", firstname=" + firstname + ", lastname="
				+ lastname + ", is_admin=" + is_admin + ", cell_ph_num="
				+ cell_ph_num + "]";
	}

}
