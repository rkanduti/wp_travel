package com.sp.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.TravelDAO;
import com.sp.entity.Expense;
import com.sp.entity.Travel;

@Service
public class TravelServiceImpl implements TravelService {
	
	@Autowired
	TravelDAO travelDAO;
	
	public List<Travel> getTravels(int userid) {
		return travelDAO.getTravels(userid);
	}

	public Travel addTravel(String departure, String arrival, String destination, int userid) {
		Travel temp = new Travel();
		
		temp.setDdep(departure);
		temp.setDarr(arrival);
		temp.setDestination(destination);
		temp.setUserid(userid);
		temp.setStatus(1);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String curr_date = dateFormat.format(date);
		
		temp.setDcre(curr_date);
		
		int travelID = travelDAO.addTravel(temp);
		
		if(travelID == -1)
			return null;
		
		temp.setTravelid(travelID);
		
		return temp;
	}

	public List<Expense> getExpenses(int travelid) {
		return travelDAO.getExpenses(travelid);
	}

	public Travel getTravel(int travelid) {
		return travelDAO.getTravel(travelid);
	}
}
