package com.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.*;
import com.sp.entity.*;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	CompanyDAO companyDAO;
	
	public Company getCompany(int companyId) {

		return companyDAO.getCompany(companyId);
	}

}
