package com.wuxincheng.ui.dao.impl;

import java.util.List;

import com.wuxincheng.ui.dao.UserDao;
import com.wuxincheng.ui.model.User;

//@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryAll() {
		return this.getSqlMapClientTemplate().queryForList("User.queryAll");
	}

	@Override
	public void modifyState(String userId) {
		this.getSqlMapClientTemplate().update("User.modifyState", userId);
	}

	@Override
	public User queryBylogiName(String logiName) {
		return (User)this.getSqlMapClientTemplate().queryForObject("User.queryBylogiName", logiName);
	}
	
}
