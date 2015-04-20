package com.wuxincheng.ui.service;

import com.wuxincheng.ui.exception.ServiceException;
import com.wuxincheng.ui.model.Comment;

public interface CommentService {

	Comment queryCommentByNewsId(String newsId);
	
	public abstract void commentsExpireProcess() throws ServiceException;

}
