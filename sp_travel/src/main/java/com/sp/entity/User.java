package com.sp.entity;

public class User {
	int userid;
	String username;
	String mail;
	String password;
	String firstname;
	String lastname;
	int companyid;
	
	public User(int userid, String username, String mail, String password, String firstname, String lastname,
			int companyid) {
		super();
		this.userid = userid;
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.companyid = companyid;
	}
	
	public User() {
		super();
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
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

	public int getCompanyid() {
		return companyid;
	}

	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
}
