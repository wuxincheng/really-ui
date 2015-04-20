package com.wuxincheng.ui.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.wuxincheng.ui.dao.WeChatDao;
import com.wuxincheng.ui.model.WeChat;
import com.wuxincheng.ui.service.WeChatService;

//@Service("weChatService")
public class WeChatServiceImpl implements WeChatService {

	@Resource private WeChatDao weChatDao;
	
	@Override
	public List<WeChat> queryAll() {
		return weChatDao.queryAll();
	}

	@Override
	public String checkOpenIdPK(String openId) {
		return weChatDao.checkOpenIdPK(openId);
	}

	@Override
	public void insert(WeChat wechat) {
		weChatDao.insert(wechat);
	}

	@Override
	public WeChat queryByOpenId(String openId) {
		return weChatDao.queryByOpenId(openId);
	}

	@Override
	public void updateState(WeChat wechat) {
		weChatDao.updateState(wechat);		
	}

}
