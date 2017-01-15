package com.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sp.entity.*;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	DataSource dataSource;
	
	public List<User> mapUsers(ResultSet rs) throws SQLException {
		List<User> users = new ArrayList<User>();
		while(rs.next()) {
			User user = new User(rs.getInt("userid"), rs.getString("username"), rs.getString("mail"), 
								   rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"),
								   rs.getInt("companyid"));
			users.add(user);
		}
		
		return users;
	}

	public User mapUser(ResultSet rs) throws SQLException {
		User user = null;
		
		if(rs.next()) 
			user = new User(rs.getInt("userid"), rs.getString("username"), rs.getString("mail"), 
					   rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"),
					   rs.getInt("companyid"));
		
		return user;
	}
	
	public User validateLogin(String username, String password) {
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		User user = new User();
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			String temp = ps.toString();
			
			ResultSet rs = ps.executeQuery();
			
			user = mapUser(rs);
			
			return user;
		}		
		catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
}
