package com.sp.dao;

import java.util.List;

import com.sp.entity.*;

public interface TravelDAO {
	List<Travel> getTravels(int userid);
	Travel getTravel(int travelid);
	int addTravel(Travel travel);
	
	List<Expense> getExpenses(int travelid);
}
