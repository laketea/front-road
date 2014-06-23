package com.bookstore.util;

import java.util.*;
import java.text.*;
import java.util.Calendar;

import com.bookstore.po.Orders;

public class Dateutil {
	
	public  String getStatus( Orders order ){
		String orderstatus=null;
		int payflag = Integer.valueOf(order.getPayflag());
		int sendflag = Integer.valueOf(order.getSendflag());
		int received = Integer.valueOf(order.getReceived());
		Date startdate = order.getOrderdate();
		Date nowdate = new Date(new java.util.Date().getTime());
		long days = this.getDays(startdate.toString(), nowdate.toString());
		if(payflag==0 ){
			if(sendflag==0){
				if(days<=2){
					//orderstatus=1;
					orderstatus="未付款";	
				}else{
					//orderstatus=2;
					orderstatus="超过付款期限";
				}	
			}			
		}else{
			if(sendflag==0){
				//orderstatus=3;
				orderstatus="已付款 等待发货";
			}else{
				if(received==1){
					//orderstatus=4;
					orderstatus="交易成功";
				}else{
					//orderstatus=5;
					orderstatus="已付款 已发货";
				}
			}
			
		}
		return orderstatus;
	}
	
	public  int getStatusInt( Orders order ){
		int orderstatus=0;
		int payflag = Integer.valueOf(order.getPayflag());
		int sendflag = Integer.valueOf(order.getSendflag());
		int received = Integer.valueOf(order.getReceived());
		Date startdate = order.getOrderdate();
		Date nowdate = new Date(new java.util.Date().getTime());
		//long days = this.getDays(startdate.toString(), nowdate.toString());
		long days=1;
		if(payflag==0 ){
			if(sendflag==0){
				if(days<=2){
					orderstatus=1;
					//orderstatus="未付款";	
				}else{
				orderstatus=2;
					//orderstatus="超过付款期限";
				}	
			}			
		}else{
			if(sendflag==0){
				orderstatus=3;
				//orderstatus="已付款 等待发货";
			}else{
				if(received==1){
					orderstatus=4;
					//orderstatus="交易成功";
				}else{
					orderstatus=5;
					//orderstatus="已付款 已发货";
				}
			}
			
		}
		return orderstatus;
	}
	
	
	
	/*
	public  long getDays(String date1, String date2) {
		  if (date1 == null || date1.equals(""))
		   return 0;
		  if (date2 == null || date2.equals(""))
		   return 0;
		  // 转换为标准时间
		  SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		  java.util.Date date = null;
		  java.util.Date mydate = null;
		  try {
		   date = myFormatter.parse(date1);
		   mydate = myFormatter.parse(date2);
		  } catch (Exception e) {
		  }
		  long day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
		  return day;
		 }
	
	 */
	public long getDays(String date1, String date2){
		long ss =1;
		return ss;
		
		
	}
	
	
}
