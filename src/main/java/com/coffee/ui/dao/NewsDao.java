package com.coffee.ui.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.coffee.ui.model.News;

@Repository("newsDao")
public class NewsDao extends BaseDao {
	
	@SuppressWarnings("unchecked")
	public List<String> queryDailyDate() {
		return this.getSqlMapClientTemplate().queryForList("News.queryDailyDate");
	}
	
	@SuppressWarnings("unchecked")
	public List<News> queryDaily(String dailyDate) {
		return this.getSqlMapClientTemplate().queryForList("News.queryDaily", dailyDate);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getAllWeChatDocid() {
		return this.getSqlMapClientTemplate().queryForList("News.getAllWechatDocid");
	}

	@SuppressWarnings("unchecked")
	public List<News> queryPager(Map<String, Object> params) {
		return this.getSqlMapClientTemplate().queryForList("News.queryPager", params);
	}
	
	@SuppressWarnings("unchecked")
	public List<News> queryAll() {
		return this.getSqlMapClientTemplate().queryForList("News.queryAll");
	}

	public Integer queryCount() {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("News.queryCount");
	}
	
	public Integer queryMaxId() {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("News.queryMaxId");
	}

	public News queryNewsById(String newsId) {
		return (News) this.getSqlMapClientTemplate().queryForObject("News.queryNewsById", newsId);
	}

	public int queryCountByParams(Map<String, Object> queryParam) {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("News.queryCountByParams", queryParam);
	}

	public void readerPlus(String newsId) {
		this.getSqlMapClientTemplate().update("News.readerPlus", newsId);
	}

}
