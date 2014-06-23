package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Suggest;
import com.bookstore.util.Page;

public interface IReviewDAO {

	// ��ӽ̰�
	public void addReview(Review review) throws DBException;

	// ɾ���̰�
	public void deleteReview(Long id) throws DBException;

	public void addSuggest(Suggest Suggest) throws DBException;

	// ɾ���̰�
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

	// ��ȡ�̰�����
	// public int getPlanCount() throws DBException;

	// ��������������ȡ�̰�����
	// public int getPlanCountSearch( Review plan ) throws DBException;

	// �����꼶��ҳ��ȡ�̰�
	// public List getGSearchListByPage(String grade,int pagesize,int curpage)
	// throws DBException;

	// public int getGCount(String grade) throws DBException;

	// ����ID��ȡ�̰�
	public Suggest getSuggest(Long id) throws DBException;

	public void updateSuggest(Suggest suggest) throws DBException;

	//
	// public Review getPlanBySubject(String subject) throws DBException;

	// ���ݱ����ȡ�̰�
	// public Review getPlanByTitle(String title) throws DBException;

	// ��ҳ��ȡ�̰�
	// public List getPlanListByPage( int pagesize , int curpage) throws
	// DBException;

}