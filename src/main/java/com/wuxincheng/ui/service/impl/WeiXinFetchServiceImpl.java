package com.wuxincheng.ui.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.wuxincheng.ui.dao.CommentDao;
import com.wuxincheng.ui.dao.NewsDao;
import com.wuxincheng.ui.dao.WeChatDao;
import com.wuxincheng.ui.exception.ServiceException;
import com.wuxincheng.ui.model.Comment;
import com.wuxincheng.ui.model.News;
import com.wuxincheng.ui.model.WeChat;
import com.wuxincheng.ui.util.WeiXinFetchTool;

//@Service("weiXinFetchService")
public class WeiXinFetchServiceImpl {
	private static Logger logger = LoggerFactory.getLogger(WeiXinFetchServiceImpl.class);

	@Autowired private NewsDao newsDao;
	@Autowired private CommentDao commentDao;
	@Autowired private WeChatDao weChatDao;
	
	/**
	 * 定时任务抓取微信公众号文章
	 */
	public void processWeiXinFetch() throws ServiceException {
		logger.info("------------ 开始定时任务抓取微信公众号文章:");
		
		// 查询所有的公众号信息
		List<WeChat> weChats = weChatDao.queryAll();
		if (null == weChats || weChats.size() < 1) { // 如果没有查询到公众号就结束定时任务
			throw new ServiceException(ServiceException.GENERAL_EXCEPTION, "没有查询到公众号信息");
		}
		logger.info("已经查询出" + weChats.size() + "条微信公众号信息");
		
		// 查询数据库中已经从微信抓取的文章唯一标识docId
		List<String> savedWeChatNewsDocidCompare = newsDao.getAllWeChatDocid();
		logger.info("已经查询出数据库中所有的微信文章的docid(搜狗搜索微信返回文章的唯一标识)");
		
		// 根据openId访问搜狗微信搜索
		for (int i = 0; i < weChats.size(); i++) {
			WeChat weChat = weChats.get(i);
			logger.info("抓取第"+(i+1)+"个公众号["+weChat.getPublicName()+"("+weChat.getPublicNO()+")]文章数据");
			if (StringUtils.isEmpty(weChat.getOpenId())) { // 如果openId为空, 继续下一个公众号文章的抓取
				logger.warn("抓取微信文章失败: openid为空");
				continue;
			}
			
			List<News> prepareSaveNews = WeiXinFetchTool.fectWeiXinContentBySogou(weChat.getOpenId(), 0);
			if (null == prepareSaveNews || prepareSaveNews.size() < 1) { // 如果没有抓取到数据继续抓取
				logger.warn("抓取微信文章失败: openid=[" + weChat.getOpenId() + "] 抓取的数据为空");
				continue;
			}
			logger.info("已经抓取" + prepareSaveNews.size() + "篇文章");
			
			saveCurrentFetchData(weChat.getOpenId(), prepareSaveNews, savedWeChatNewsDocidCompare);
			
			logger.info("抓取微信公众号["+weChat.getPublicName()+"("+weChat.getPublicNO()+")]文章完成.");
			if ((i + 1) < weChats.size()) {
				System.out.println("");
			}
		}
		
		logger.info("------------ 定时任务抓取微信公众号文章完成.");
		
		System.out.println("");
		System.out.println("");
	}

	/**
	 * 保存抓取的文章
	 * 
	 * @param openid
	 *            搜狗的openId
	 * @param prepareSaveNews
	 *            需要保存的数据
	 * @param docidSavedCompare
	 *            数据库中已经保存文章的docId
	 */
	private void saveCurrentFetchData(String openid, List<News> prepareSaveNews, List<String> docidSavedCompare) {
		for (News prepareSaveNew : prepareSaveNews) {
			if (docidSavedCompare != null && docidSavedCompare.size() > 0) {
				if (docidSavedCompare.contains(prepareSaveNew.getSogouDocid())) {
					// logger.info("文章[" + prepareSaveNew.getTitle() + "]在数据库中已经存在");
					// 验证是否已经保存此微信文章了, docId是搜狗返回的唯一标识
					continue;
				}
			}
			
			prepareSaveNew.setSogouOpenid(openid);
			newsDao.insert(prepareSaveNew);
			
			int newsid = newsDao.queryNewsIdByDocid(prepareSaveNew.getSogouDocid());
			Comment comment = new Comment();
			comment.setNewsId(newsid+"");
			comment.setBackground(2014000000);
			comment.setAlpha(-1);
			comment.setCreator("2");
			comment.setState("1"); // 1-不显示, 0-显示
			commentDao.insert(comment);
			
			logger.info("添加文章成功, data: " + prepareSaveNew.toString());
		}
	}
	
}
