package com.wuxincheng.ui.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.wuxincheng.ui.dao.MessageDao;
import com.wuxincheng.ui.model.Message;
import com.wuxincheng.ui.service.MessageService;

//@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Resource private MessageDao messageDao;
	
	@Override
	public List<Message> queryAll() {
		return messageDao.queryAll();
	}

}
