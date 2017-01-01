package com.sp.dao;

import java.util.List;

import com.sp.entity.*;

public interface LoginDAO {
	User validateLogin(String username, String password);
}
