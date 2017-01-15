package com.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.entity.Company;

@Repository
public class CompanyDAOImpl implements CompanyDAO {

	@Autowired
	DataSource dataSource;
	
	public Company mapCompany(ResultSet rs) throws SQLException {
		Company company = null;
		
		if(rs.next()) 
			company = new Company(rs.getInt("companyid"), rs.getString("name"), rs.getString("address"), 
					   rs.getString("city"), rs.getString("country"));
		
		return company;
	}
	
	public Company getCompany(int companyId) {
		String sql = "SELECT * FROM company WHERE companyid = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		Company company = new Company();
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, companyId);
			
			String temp = ps.toString();
			
			ResultSet rs = ps.executeQuery();
			
			company = mapCompany(rs);
			
			return company;
		}		
		catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}

}
