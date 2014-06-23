package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Suggest;
import com.bookstore.util.Page;

public interface IReviewDAO {

	// 添加教案
	public void addReview(Review review) throws DBException;

	// 删除教案
	public void deleteReview(Long id) throws DBException;

	public void addSuggest(Suggest Suggest) throws DBException;

	// 删除教案
	public void deleteSuggest(Long id) throws DBException;

	public Page getGodsReviewPage(int pagesize, int curpage, String id)
			throws DBException;

	public Page getReviewPage(int pagesize, int curpage)
			throws DBException;

	public Page getUserReviewPage(int pagesize, int curpage, String id)
			throws DBException;

	public Page getSuggestPage(int pagesize, int curpage, int id)
			throws DBException;

	public Page getUserSuggestPage(int pagesize, int curpage, String id)
			throws DBException;

	// 获取教案总数
	// public int getPlanCount() throws DBException;

	// 根据搜索条件获取教案总数
	// public int getPlanCountSearch( Review plan ) throws DBException;

	// 根据年级分页获取教案
	// public List getGSearchListByPage(String grade,int pagesize,int curpage)
	// throws DBException;

	// public int getGCount(String grade) throws DBException;

	// 根据ID获取教案
	public Suggest getSuggest(Long id) throws DBException;

	public void updateSuggest(Suggest suggest) throws DBException;

	//
	// public Review getPlanBySubject(String subject) throws DBException;

	// 根据标题获取教案
	// public Review getPlanByTitle(String title) throws DBException;

	// 分页获取教案
	// public List getPlanListByPage( int pagesize , int curpage) throws
	// DBException;

}