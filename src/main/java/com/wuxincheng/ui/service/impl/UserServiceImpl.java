package com.wuxincheng.ui.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.wuxincheng.ui.dao.UserDao;
import com.wuxincheng.ui.model.User;
import com.wuxincheng.ui.service.UserService;

//@Repository("userService")
public class UserServiceImpl implements UserService {
	
	@Resource private UserDao userDao;

	@Override
	public List<User> queryAll() {
		return userDao.queryAll();
	}

	@Override
	public void modifyState(String userId) {
		// TODO 禁止用户登录
	}

	@Override
	public User queryBylogiName(String logiName) {
		return userDao.queryBylogiName(logiName);
	}

}
