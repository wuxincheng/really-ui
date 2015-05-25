package com.coffee.ui.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.coffee.ui.dao.CommentDao;
import com.coffee.ui.dao.NewsDao;
import com.coffee.ui.model.News;
import com.coffee.ui.util.Constants;

/**
 * 帖子Service
 * 
 * @author wuxincheng
 *
 */
@Service("newsService")
public class NewsService {
	private static Logger logger = LoggerFactory.getLogger(NewsService.class);

	@Resource private NewsDao newsDao;
	@Resource private CommentDao commentDao;
	
	private static final String WEB_NAME = Constants.WEB_NAME;
	
	public List<String> queryDailyDate(){
		return newsDao.queryDailyDate();
	}
	
	public List<News> getNewsByDaily(String dailyDate){
		return newsDao.queryDaily(dailyDate);
	}
	
	public Map<String, Object> queryPager(Map<String, Object> queryParam) {
		logger.info(WEB_NAME+"查询所有博客信息");
		
		// 返回结果
		Map<String, Object> reault = new HashMap<String, Object>();
		
		// 查询条件
		// int start, int end
		// Map<String, Object> params = new HashMap<String, Object>();
		// params.put("start", start);
		// params.put("end", end);
		
		int totalCount = newsDao.queryCountByParams(queryParam); // 总记录数
		List<News> news = newsDao.queryPager(queryParam); // 当前页的数据
		
		reault.put("news", news);
		reault.put("totalCount", totalCount);
		
		return reault;
	}

	public News queryNewsById(String newsId) {
		logger.info(WEB_NAME+"根据主键查询帖子, newsId: " + newsId);
		
		return newsDao.queryNewsById(newsId);
	}

	public void readerPlus(String newsId) {
		newsDao.readerPlus(newsId);
	}
	
}
