package com.wuxincheng.ui.dao;

import java.util.List;

import com.wuxincheng.ui.model.Message;

public interface MessageDao {
	
	public abstract List<Message> queryAll();
	
}
