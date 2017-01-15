package com.sp.entity;

import java.util.List;

public class Travel {
	int travelid;
	String destination;
	String ddep;
	String darr;
	String dcre;
	int status;
	int userid;
	List<Expense> expenses;
	
	public Travel(int travelid, String destination, String ddep, String darr, String dcre, int status, int userid) {
		super();
		this.travelid = travelid;
		this.destination = destination;
		this.ddep = ddep;
		this.darr = darr;
		this.dcre = dcre;
		this.status = status;
		this.userid = userid;
	}
	
	public Travel() {
		super();
	}

	public int getTravelid() {
		return travelid;
	}

	public void setTravelid(int travelid) {
		this.travelid = travelid;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDdep() {
		return ddep;
	}

	public void setDdep(String ddep) {
		this.ddep = ddep;
	}

	public String getDarr() {
		return darr;
	}

	public void setDarr(String darr) {
		this.darr = darr;
	}

	public String getDcre() {
		return dcre;
	}

	public void setDcre(String dcre) {
		this.dcre = dcre;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public List<Expense> getExpenses() {
		return expenses;
	}

	public void setExpenses(List<Expense> expenses) {
		this.expenses = expenses;
	}
	
	public void addExpense(Expense expense) {
		expenses.add(expense);
	}
}
