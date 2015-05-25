package com.coffee.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coffee.ui.model.News;
import com.coffee.ui.service.NewsService;
import com.coffee.ui.util.Constants;
import com.coffee.ui.util.DateUtil;
import com.coffee.ui.util.Validation;

/**
 * 咖啡日报 - 每天日报
 */
@Controller
@RequestMapping("/daily")
public class DailyController {
	private static Logger logger = LoggerFactory
			.getLogger(DailyController.class);

	private static final String WEB_NAME = Constants.WEB_NAME;

	@Autowired
	private NewsService newsService;

	/**
	 * 获取日报
	 * 
	 * @param request
	 * @param dailyDate
	 *            格式yyyyMMdd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/show")
	public String list(HttpServletRequest request, String dailyDate, Model model) {
		logger.info("{}显示文章列表页面 dailyDate={}", WEB_NAME, dailyDate);

		List<String> dailys = this.queryDailyDateArray(request);
		if (null == dailys || dailys.size() < 1) {
			return "daily";
		}
		
		if (StringUtils.isEmpty(dailyDate)) { // 默认日期为当天, 日期格式: 20151010
			dailyDate = dailys.get(0);
		}
		
		if (!Validation.isDateCheck(dailyDate)) {
			logger.info("无效的日报日期 dailyDate={}", dailyDate);
			return "daily";
		}

		List<News> news = newsService.getNewsByDaily(dailyDate);

		int dailyIndex = dailys.indexOf(dailyDate);
		String dailyBefore = null, dailyAfter = null;
		if (dailyIndex > 0) {
			int beforeIndex = dailyIndex - 1;
			dailyBefore = dailys.get(beforeIndex);
		}
		if (dailyIndex < dailys.size() - 1) {
			int afterIndex = dailyIndex + 1;
			dailyAfter = dailys.get(afterIndex);
		}

		model.addAttribute("dailyBefore", dailyBefore);
		model.addAttribute("dailyAfter", dailyAfter);
		model.addAttribute("dailyDate", dailyDate);
		
		model.addAttribute("showBefore", DateUtil.formatDaily(dailyBefore));
		model.addAttribute("showAfter", DateUtil.formatDaily(dailyAfter));
		model.addAttribute("showDate", DateUtil.formatDaily(dailyDate));
		
		model.addAttribute("news", news);

		return "daily";
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

	private List<String> queryDailyDateArray(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<String> dailys = (List<String>) request.getSession().getAttribute(
				"dailys");
		if (null == dailys || dailys.size() < 1) {
			dailys = newsService.queryDailyDate();
			request.getSession().setAttribute("dailys", dailys);
		}
		return dailys;
	}

}
