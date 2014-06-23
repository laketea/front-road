package com.bookstore.dao;

public class DAOFactory {
	public static INewsDAO getNewsDAO(){
		INewsDAO dao=null;
		dao=new NewsDAO();
		return dao;
	}
	
	public static IReviewDAO getReviewDAO(){
		IReviewDAO dao=null;
		dao=new ReviewDAO();
		return dao;
	}
	
	public static ITestDAO getTestDAO(){
		ITestDAO dao=null;
		dao=new TestDAO();
		return dao;
	}
	
	public static IAdminDAO getAdminDAO(){
		IAdminDAO dao=null;
		dao=new AdminDAO();
		return dao;
	}
	public static IGodsDAO getGodsDAO(){
		IGodsDAO dao=null;
		dao=new GodsDAO();
		return dao;
	}
	public static IUserDAO getUserDAO(){
		IUserDAO dao=null;
		dao=new UserDAO();
		return dao;
	}
	
	public static IOrderDAO getOrderDAO(){
		IOrderDAO dao=null;
		dao=new OrderDAO();
		return dao;
	}
	public static IGuestDAO getGuestDAO(){
		IGuestDAO dao=null;
		dao=new GuestDAO();
		return dao;
	}
/*
	public static IAlbumDAO getAlbumDAO(){
		IAlbumDAO dao=null;
		dao=new AlbumDAO();
		return dao;
	}
	public static IPriceDAO getPriceDAO(){
		IPriceDAO dao=null;
		dao=new PriceDAO();
		return dao;
	}
	
*/
}

