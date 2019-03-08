package com.chart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chart.model.User;
import com.chart.model.charts;
import com.chart.service.UserService;

/**
*@author WCG
*@date: 2019��3��8�� ����10:09:58
*/
@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping("/lineChart")
	public String lineChart() {
		
		return "/lineChart";
	}
	
	@RequestMapping("/pieChart")
	public String pieChart() {
		
		return "/pieChart";
	}
	
	@RequestMapping("/barChart")
	public String barChart() {
		
		return "/barChart";
	}
	
	//����  ��״ȡֵ
	@RequestMapping("/chart1")
	@ResponseBody
	public List<User> chart1(Model model){
		List<User> userList = service.getUserList();
		return userList;
	}
	
	//����ȡֵ
	@RequestMapping("/chart2")
	@ResponseBody
	public List<charts> chart2(Model model){
		List<User> userList = service.getUserList();
		List<charts> chart = new ArrayList<charts>();
		for (User user : userList) {
			charts a = new charts(user.getScore(), user.getName());
			chart.add(a);
		}
		return chart;
	}
}
