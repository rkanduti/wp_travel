package com.sp.service;

import java.util.List;

import com.sp.entity.*;

public interface TravelService {
	List<Travel> getTravels(int userid);
	Travel getTravel(int travelid);
	Travel addTravel(String departure, String arrival, String destination, int userid);
	
	List<Expense> getExpenses(int travelid);
}
