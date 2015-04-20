package com.wuxincheng.ui.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.wuxincheng.ui.dao.AdminsDao;
import com.wuxincheng.ui.model.Admins;
import com.wuxincheng.ui.service.AdminsService;

//@Repository("adminsService")
public class AdminsServiceImpl implements AdminsService {
	
	@Resource private AdminsDao adminsDao;

	@Override
	public Admins query(String adminsLogin) {
		Admins admins = new Admins();
		admins.setAdminsLogin(adminsLogin);
		return adminsDao.query(admins);
	}

	@Override
	public Admins login(String adminsLogin, String adminsPwd) {
		Admins admins = new Admins();
		admins.setAdminsLogin(adminsLogin);
		admins.setAdminsPwd(adminsPwd);
		return adminsDao.query(admins);
	}

	@Override
	public void insert(Admins admins) {
		adminsDao.insert(admins);
	}

	@Override
	public void update(Admins admins) {
		adminsDao.update(admins);
	}

	@Override
	public void modifyPwd(Admins admins) {
		adminsDao.modifyPwd(admins);
	}

	@Override
	public List<Admins> queryAll() {
		return adminsDao.queryAll();
	}

	@Override
	public void edit(Admins admins) {
		
	}

}
