package com.wuxincheng.ui.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 博客管理
 * 
 * @author wuxincheng
 *
 */
@Controller
@RequestMapping("/manage/blogInfo")
public class BlogInfoController extends BaseController {

	private static Logger logger = LoggerFactory.getLogger(BlogInfoController.class);
	
	/** 每页显示条数 */
	
	//@Autowired private BlogInfoService blogInfoService;
	//@Autowired private WeChatService typeService;
	
	/**
	 * 显示列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, String currentPage, Model model) {
		logger.info("显示博客列表页面");
		setMenuFlag(request, "blogInfo");
		
		
		return "info/list";
	}
	
}
