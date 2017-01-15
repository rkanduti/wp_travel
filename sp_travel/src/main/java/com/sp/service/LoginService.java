package com.sp.service;

import java.util.List;

import com.sp.entity.*;

public interface LoginService {
	User validateLogin(String username, String password);
}
