package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
import net.sf.hibernate.Criteria;
import net.sf.hibernate.expression.*;


import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;
import com.bookstore.util.HibernateSessionFactory;

public class GuestDAO implements IGuestDAO  {
	
	
//��ӽ̰�***********************************************************************
	public void addGuest(Guest Guest) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(Guest);
			tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("�������ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//
	public Guest getGuestBySubject(String subject) throws DBException {
		Session session;
		Guest Guest = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Guest Guest where Guest.subject=:subject order by id desc")
					.setString("subject", subject).list();
			if (list != null && list.size() > 0) {
				Guest = (Guest) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
		return Guest;
	}
	
//���ݱ����ȡ�̰�*************************************************************************
	public Guest getGuestByTitle(String title) throws DBException {
		Session session;
		Guest Guest = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Guest Guest where Guest.title=:title")
					.setString("title", title).list();
			if (list != null && list.size() > 0) {
				Guest = (Guest) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
		return Guest;
	}
	
//ɾ���̰�**********************************************************************
	public void deleteGuest(Long id) throws DBException {
		Session session;
		Guest Guest = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		Guest = (Guest) session.load(Guest.class, id);
		session.delete(Guest);
		tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("���¶���ʧ�ܣ�");
		} finally {
			try {
		HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}
	
//�޸Ľ̰�**********************************************************************
	public void updateGuest(Guest Guest) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(Guest);
			tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}

//����ID��ȡ�̰�**********************************************************************
	public Guest getGuest(Long id) throws DBException {
		Session session;
		Guest Guest = null;  
		try {
			session = HibernateSessionFactory.currentSession();
			Guest = (Guest) session.get(Guest.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
		return Guest;
	}

	
//�����꼶��Ŀ��ҳ��ȡ�̰�**********************************************************************
	public List getSearchListByPage( Guest Guest,int pagesize,int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			//Criteria criteria = new Criteria();
			Example exampleGuest = Example.create(Guest);
			exampleGuest.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Guest.class)
								.add(exampleGuest)
								.addOrder(Order.desc("id"))
								.setFirstResult((curpage-1)*pagesize)
								.setMaxResults(pagesize);
			list = criteria.list();
			/*list = session
					.createQuery("from com.bookstore.po.Guest Guest where Guest.grade=:grade "+"and Guest.subject=:subject")
					.setString("grade",Guest.getGrade())
					.setString("subject", Guest.getSubject())
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			*/
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return list;
	}
	
	public List getConListByPage(int pagesize,int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Guest Guest where Guest.confirm=:confirm  order by id desc ")
					.setString("confirm","0")
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return list;
	}
	
	public List getFConListByPage(int pagesize,int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Guest Guest where Guest.confirm=:confirm  order by id desc ")
					.setString("confirm","1")
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return list;
	}
	
	
	public List getFeedListByPage(int pagesize,int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Guest Guest where Guest.confirm=:confirm and Guest.feedflag=:feedflag order by id desc ")
					.setString("confirm","1")
					.setString("feedflag","0")
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return list;
	}
	
//��ҳ��ȡ�̰�**********************************************************************
	public List getGuestListByPage( int pagesize , int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Guest Guest order by id desc ")
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return list;
	}
	
	//��ȡ�̰�����
	public int getGuestCount( ) throws DBException {
		int counts;
		Session session;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			list =session
			.createQuery(" from com.bookstore.po.Guest Guest  ")
			.list();
			counts   =  list.size(); 
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return counts;
	}
	
	public int getGuestCountCon( ) throws DBException {
		int counts;
		Session session;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			 list =session
					.createQuery(" from com.bookstore.po.Guest Guest where Guest.confirm='0' ")
					.list();
			counts   =  list.size(); 

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return counts;
	}
	
	public int getGuestFCountCon( ) throws DBException {
		int counts;
		Session session;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			 list =session
					.createQuery(" from com.bookstore.po.Guest Guest where Guest.confirm='1' ")
					.list();
			counts   =  list.size(); 

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return counts;
	}
	
	public int getGuestCountFeed( ) throws DBException {
		int counts;
		Session session;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			 list =session
					.createQuery(" from com.bookstore.po.Guest Guest where Guest.confirm='1' and Guest.feedflag='0' ")
					.list();
			counts   =  list.size(); 

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return counts;
	}
	
	//��������������ȡ�̰�����
     public int getGuestCountSearch( Guest Guest ) throws DBException {
		
		int totalCount;
		Session session;
		Criteria criteria;
		try {
			session = HibernateSessionFactory.currentSession();
			Example exampleGuest = Example.create(Guest);
			exampleGuest.ignoreCase().enableLike(MatchMode.ANYWHERE);
			criteria = session.createCriteria(Guest.class)
								.add(exampleGuest);
			totalCount = criteria.list().size();
			
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("��ȡ����ʧ�ܣ�");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("�ر�sessionʧ�ܣ�");
			}
		}
		return  totalCount;     

	}
	
     public int getGCount( String grade ) throws DBException {
 		
 		int totalCount;
 		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Guest Guest where Guest.grade=:grade order by id desc ")
					.setString("grade",grade)
					.list();
 			totalCount = list.size();
 			
 		} catch (HibernateException e) {
 			e.printStackTrace();
 			throw new DBException("��ȡ����ʧ�ܣ�");
 		} finally {
 			try {
 				HibernateSessionFactory.closeSession();
 			} catch (HibernateException e) {
 				e.printStackTrace();
 				throw new DBException("�ر�sessionʧ�ܣ�");
 			}
 		}
 		return  totalCount;     

 	}
	
	
}
