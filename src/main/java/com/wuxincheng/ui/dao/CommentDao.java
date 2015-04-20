package com.wuxincheng.ui.dao;

import java.util.List;

import com.wuxincheng.ui.model.Comment;

public interface CommentDao {

	public abstract void insert(Comment comment);

	public abstract void update(Comment comment);

	public abstract void sendNews4App(String newsId);

	public abstract Comment queryCommentByNewsId(String newsId);
	
	public abstract Integer delete(Long commentId);
	
	public abstract List<Comment> queryExpireComments();
	
}
