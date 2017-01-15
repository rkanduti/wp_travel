package com.sp.entity;

public class Company {
	int companyid;
	String name;
	String address;
	String city;
	String country;
	
	public Company(int companyid, String name, String address, String city, String country) {
		super();
		this.companyid = companyid;
		this.name = name;
		this.address = address;
		this.city = city;
		this.country = country;
	}
	
	public Company() {
		super();
	}
	
	public int getCompanyid() {
		return companyid;
	}
	
	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
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
}
