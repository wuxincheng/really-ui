package com.coffee.ui.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffee.ui.model.News;
import com.coffee.ui.service.NewsService;
import com.coffee.ui.util.Constants;
import com.coffee.ui.util.DateUtil;
import com.coffee.ui.util.Validation;

/**
 * 咖啡日报 - 首页管理(文章列表页面)
 */
@Controller
@RequestMapping("/index")
public class IndexController {

private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/** 每页显示条数 */
	private final Integer pageSize = 10;
	
	/** 当前页面 */
	private String currentPage;
	
	private static final String WEB_NAME = Constants.WEB_NAME;
	
	@Autowired private NewsService newsService;
	
	/** 查询日期 */
	private String queryStartDate;
	private String queryEndDate;

	@RequestMapping(value = "/")
	public String list(HttpServletRequest request, String currentPage, 
			String queryStartDate, String queryEndDate, Model model) {
		logger.info(WEB_NAME + "显示文章列表页面");
		
		if (Validation.isBlank(currentPage) || !Validation.isInt(currentPage, "0+")) {
			currentPage = "1";
		}
		
		this.currentPage = currentPage;
		
		Integer current = Integer.parseInt(currentPage);
		Integer start = null;
		Integer end = null;
		if (current > 1) {
			start = (current - 1) * pageSize;
			end = pageSize;
		} else {
			start = 0;
			end = pageSize;
		}
		
		String queryEndDateAfter = null;
		if (StringUtils.isEmpty(this.queryStartDate) || StringUtils.isEmpty(this.queryEndDate)) {
			this.queryStartDate = null;
			this.queryEndDate = null;
		} else {
			queryEndDateAfter = DateUtil.getSpecifiedDayAfter(this.queryEndDate, "yyyyMMdd");
		}
		
		// 封装查询条件
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("start", start);
		queryParam.put("end", end);
		queryParam.put("queryStartDate", this.queryStartDate);
		queryParam.put("queryEndDate", queryEndDateAfter);
		
		Map<String, Object> pager = newsService.queryPager(queryParam);
		
		try {
			if (pager != null && pager.size() > 0) {
				Integer totalCount = (Integer)pager.get("totalCount");
				Integer lastPage = (totalCount/pageSize);
				Integer flag = (totalCount%pageSize)>0?1:0;
				pager.put("lastPage", lastPage + flag);
				
				// 如果当前页数大于总页数, 减1处理
				if (current > (lastPage + flag)) {
					current--;
					this.currentPage = current+"";
				}
				
				logger.info(this.currentPage);
				
				pager.put("currentPage", current);
				pager.put("pageSize", pageSize);
				
				model.addAttribute("pager", pager);
				
				// 设置第一个显示的日期
				@SuppressWarnings("unchecked")
				List<News> news = (List<News>)pager.get("news");
				model.addAttribute("firstCreateTime", news.get(0).getCreateTime());
			} else {
				model.addAttribute("news", Collections.EMPTY_LIST);
				logger.info(WEB_NAME + "没有查询到文章信息");
			}
		} catch (Exception e) {
			logger.info(WEB_NAME + "没有查询到文章信息", e);
		}
		
		return "carouselrows";
	}
	
	@RequestMapping(value = "/more")
	@ResponseBody
	public Map<String, Object> more(String currentPage) {
		logger.info(WEB_NAME + "点击加载更多: " + currentPage);
		
		if (Validation.isBlank(currentPage) || !Validation.isInt(currentPage, "0+")) {
			currentPage = "1";
		}
		
		Integer current = Integer.parseInt(currentPage);
		Integer start = null;
		Integer end = null;
		if (current > 1) {
			start = (current - 1) * pageSize;
			end = pageSize;
		} else {
			start = 0;
			end = pageSize;
		}
		
		String queryEndDateAfter = null;
		if (StringUtils.isEmpty(this.queryStartDate) || StringUtils.isEmpty(this.queryEndDate)) {
			this.queryStartDate = null;
			this.queryEndDate = null;
		} else {
			queryEndDateAfter = DateUtil.getSpecifiedDayAfter(this.queryEndDate, "yyyyMMdd");
		}
		
		// 封装查询条件
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("start", start);
		queryParam.put("end", end);
		queryParam.put("queryStartDate", this.queryStartDate);
		queryParam.put("queryEndDate", queryEndDateAfter);
		
		Map<String, Object> pager = newsService.queryPager(queryParam);
		
		try {
			if (pager != null && pager.size() > 0) {
				Integer totalCount = (Integer)pager.get("totalCount");
				Integer lastPage = (totalCount/pageSize);
				Integer flag = (totalCount%pageSize)>0?1:0;
				pager.put("lastPage", lastPage + flag);
				
				// 如果当前页数大于总页数, 减1处理
				if (current > (lastPage + flag)) {
					current--;
					this.currentPage = current+"";
				}
				
				pager.put("currentPage", current);
				pager.put("pageSize", pageSize);
			} else {
				logger.info(WEB_NAME + "没有查询到文章信息");
			}
		} catch (Exception e) {
			logger.info(WEB_NAME + "查询文章明细时出现异常", e);
		}
		
		return pager;
	}
	
	@RequestMapping(value = "/detail")
	public String detail(String id, Model model) {
		if (StringUtils.isEmpty(id)) {
			logger.info(WEB_NAME + "ID链接为空");
			model.addAttribute("msg", "链接为空");
		}
		
		News news = newsService.queryNewsById(id);
		if (null == news) {
			logger.info(WEB_NAME + "文章不存在 id={}", id);
			model.addAttribute("msg", "文章不存在");
		}
		
		// 访问量+1
		newsService.readerPlus(id);
		
		model.addAttribute("news", news);
		
		return "article_detail";
	}
	
}
