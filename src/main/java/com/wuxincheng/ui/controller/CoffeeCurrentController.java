package com.wuxincheng.ui.controller;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wuxincheng.ui.service.NewsService;
import com.wuxincheng.ui.util.DateUtil;
import com.wuxincheng.ui.util.Validation;

/**
 * 咖啡当天日报
 */
@Controller
@RequestMapping("/coffee/current")
public class CoffeeCurrentController {

private static Logger logger = LoggerFactory.getLogger(CoffeeCurrentController.class);
	
	/** 每页显示条数 */
	private final Integer pageSize = 20;
	
	/** 当前页面 */
	private String currentPage;
	
	@Autowired private NewsService newsService;
	
	/** 查询日期 */
	private String queryStartDate;
	private String queryEndDate;

	@RequestMapping(value = "/index")
	public String list(HttpServletRequest request, String currentPage, Model model) {
		logger.info("显示当天文章列表页面");
		
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
		
		// 默认查询当天
		this.queryStartDate = DateUtil.getCurrentDate(new Date(), "yyyyMMdd");
		this.queryEndDate = DateUtil.getSpecifiedDayAfter(this.queryStartDate, "yyyyMMdd");
		
		// 封装查询条件
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("start", start);
		queryParam.put("end", end);
		queryParam.put("queryStartDate", this.queryStartDate);
		queryParam.put("queryEndDate", this.queryEndDate);
		
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
			} else {
				model.addAttribute("news", Collections.EMPTY_LIST);
				logger.info("没有查询到文章信息");
			}
		} catch (Exception e) {
			logger.error("在查询当天文章明细时出现异常", e);
		}
		
		return "coffee/current";
	}
	
	@RequestMapping(value = "/more")
	@ResponseBody
	public Map<String, Object> more(String currentPage) {
		logger.info("当天点击加载更多：" + currentPage);
		
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
		
		// 封装查询条件
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("start", start);
		queryParam.put("end", end);
		queryParam.put("queryStartDate", this.queryStartDate);
		queryParam.put("queryEndDate", this.queryEndDate);
		
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
				logger.info("没有查询到文章信息");
			}
		} catch (Exception e) {
			logger.error("在查询文章明细时出现异常", e);
		}
		
		return pager;
	}
	
}
