package com.chart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chart.dao.UserMapper;
import com.chart.model.User;
import com.chart.service.UserService;

/**
*@author WCG
*@date: 2019��3��8�� ����10:09:18
*/
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return mapper.getUserList();
	}

}
