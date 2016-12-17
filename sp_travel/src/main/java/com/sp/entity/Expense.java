package com.sp.entity;

public class Expense {
	int expenseid;
	String type;
	String name;
	float amount;
	String proofpath;
	int travelid;

	public Expense(int expenseid, String type, String name, float amount, String proofpath, int travelid) {
		super();
		this.expenseid = expenseid;
		this.type = type;
		this.name = name;
		this.amount = amount;
		this.proofpath = proofpath;
		this.travelid = travelid;
	}

	public Expense() {
		super();
	}

	public int getExpenseid() {
		return expenseid;
	}

	public void setExpenseid(int expenseid) {
		this.expenseid = expenseid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getProofpath() {
		return proofpath;
	}

	public void setProofpath(String proofpath) {
		this.proofpath = proofpath;
	}

	public int getTravelid() {
		return travelid;
	}

	public void setTravelid(int travelid) {
		this.travelid = travelid;
	}
}
