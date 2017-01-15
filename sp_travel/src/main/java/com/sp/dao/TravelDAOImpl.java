package com.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.entity.Expense;
import com.sp.entity.Travel;

@Repository
public class TravelDAOImpl implements TravelDAO {
	
	@Autowired
	DataSource dataSource;
	
	public List<Travel> mapTravels(ResultSet rs) throws SQLException {
		List<Travel> travels = new ArrayList<Travel>();
		while(rs.next()) {
			Travel travel = new Travel(rs.getInt("travelid"), rs.getString("destination"), rs.getString("ddep"), 
								   rs.getString("darr"), rs.getString("dcre"), rs.getInt("status"),
								   rs.getInt("userid"));
			travels.add(travel);
		}
		
		return travels;
	}

	public Travel mapTravel(ResultSet rs) throws SQLException {
		Travel travel = null;
		if(rs.next()) {
			travel = new Travel(rs.getInt("travelid"), rs.getString("destination"), rs.getString("ddep"), 
								   rs.getString("darr"), rs.getString("dcre"), rs.getInt("status"),
								   rs.getInt("userid"));
		}
		
		return travel;
	}

	public List<Expense> mapExpenses(ResultSet rs) throws SQLException {
		List<Expense> expenses = new ArrayList<Expense>();
		while(rs.next()) {
			Expense expense = new Expense(rs.getInt("expenseid"), rs.getString("type"), rs.getString("name"), 
								   rs.getFloat("amount"), rs.getString("proofpath"), rs.getInt("travelid"));
			expenses.add(expense);
		}
		
		return expenses;
	}

	public List<Travel> getTravels(int userid) {
		String sql = "SELECT * FROM travel WHERE userid = ? ORDER BY darr DESC";
		Connection conn = null;
		PreparedStatement ps = null;
		List<Travel> travels = new ArrayList<Travel>();
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			
			ResultSet rs = ps.executeQuery();
			
			travels = mapTravels(rs);
			
			return travels;
		}		
		catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}

	public Travel getTravel(int travelid) {
		String sql = "SELECT * FROM travel WHERE travelid = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, travelid);
						
			ResultSet rs = ps.executeQuery();
			
			return mapTravel(rs);
		}		
		catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
	
	public int addTravel(Travel travel) {
		String sql = "INSERT INTO travel (destination, ddep, darr, dcre, status, userid) VALUES (?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, travel.getDestination());
			ps.setString(2, travel.getDdep());
			ps.setString(3, travel.getDarr());
			ps.setString(4, travel.getDcre());
			ps.setInt(5, travel.getStatus());
			ps.setInt(6, travel.getUserid());
						
			return ps.executeUpdate();
		}		
		catch (Exception e) {
			return -1;
			// TODO: handle exception
		}
	}

	public List<Expense> getExpenses(int travelid) {
		String sql = "SELECT * FROM expenses WHERE travelid = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, travelid);
			
			ResultSet rs = ps.executeQuery();
			
			return mapExpenses(rs);
		}		
		catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}

}
