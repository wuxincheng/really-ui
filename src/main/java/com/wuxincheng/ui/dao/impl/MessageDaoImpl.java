package com.wuxincheng.ui.dao.impl;

import java.util.List;

import com.wuxincheng.ui.dao.MessageDao;
import com.wuxincheng.ui.model.Message;

//@Repository("messageDao")
public class MessageDaoImpl extends BaseDao implements MessageDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> queryAll() {
		return this.getSqlMapClientTemplate().queryForList("Message.queryAll");
	}

}
