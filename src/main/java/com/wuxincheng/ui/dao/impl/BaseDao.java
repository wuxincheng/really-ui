package com.wuxincheng.ui.dao.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("baseDao")
public class BaseDao extends SqlMapClientDaoSupport {
	
	@Resource
	private SqlMapClient sqlMapClient;
	
	@PostConstruct
	public void initSqlMapClient() {
		super.setSqlMapClient(sqlMapClient);
	}
	
}
