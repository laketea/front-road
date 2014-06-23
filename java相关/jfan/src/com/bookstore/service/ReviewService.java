package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IReviewDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Suggest;
import com.bookstore.util.Page;

public class ReviewService {
	// static Logger log = Logger.getLogger(PlanService.class.getName());
	// 添加教案
	public void addReview(Review review) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		// log.info("保存用户对象->用户名："+plan.getPlanname());
		dao.addReview(review);
	}

	public void addSuggest(Suggest Suggest) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		// log.info("保存用户对象->用户名："+plan.getPlanname());
		dao.addSuggest(Suggest);
	}

	public Suggest getSuggest(Long id) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		return dao.getSuggest(id);
	}

	public void UpdateSuggest(Suggest Suggest) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		dao.updateSuggest(Suggest);
	}

	// 删除教案
	public void deleteReview(Long id) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		dao.deleteReview(id);
	}

	public void deleteSuggest(Long id) throws DBException {
		IReviewDAO dao = DAOFactory.getReviewDAO();
		dao.deleteSuggest(id);
	}

	public Page getGodsReviewPage(int pagesize, int curpage, String id)
			throws DBException {
		Page page = null;
		IReviewDAO dao = DAOFactory.getReviewDAO();
		page = dao.getGodsReviewPage(pagesize, curpage, id);
		return page;
	}

	public Page getReviewPage(int pagesize, int curpage)
			throws DBException {
		Page page = null;
		IReviewDAO dao = DAOFactory.getReviewDAO();
		page = dao.getReviewPage(pagesize, curpage);
		return page;
	}

	public Page getSuggestPage(int pagesize, int curpage, int id)
			throws DBException {
		Page page = null;
		IReviewDAO dao = DAOFactory.getReviewDAO();
		page = dao.getSuggestPage(pagesize, curpage, id);
		return page;
	}

	public Page getUserReviewPage(int pagesize, int curpage, String id)
			throws DBException {
		Page page = null;
		IReviewDAO dao = DAOFactory.getReviewDAO();
		page = dao.getUserReviewPage(pagesize, curpage, id);
		return page;
	}

	public Page getUserSuggestPage(int pagesize, int curpage, String id)
			throws DBException {
		Page page = null;
		IReviewDAO dao = DAOFactory.getReviewDAO();
		page = dao.getUserSuggestPage(pagesize, curpage, id);
		return page;
	}

	/*
	 * public List getReviewList(String column)throws DBException{ List
	 * list=null; IReviewDAO dao = DAOFactory.getReviewDAO();
	 * list=dao.getReviewList(column); return list; }
	 */
}
