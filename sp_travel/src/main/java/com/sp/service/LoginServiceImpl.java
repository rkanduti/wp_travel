package com.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.LoginDAO;
import com.sp.entity.Company;
import com.sp.entity.Travel;
import com.sp.entity.User;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDAO loginDAO;
	
	public User validateLogin(String username, String password) {
		return loginDAO.validateLogin(username, password);
	}
}
