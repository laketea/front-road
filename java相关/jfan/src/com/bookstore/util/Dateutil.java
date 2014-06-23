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
					orderstatus="δ����";	
				}else{
					//orderstatus=2;
					orderstatus="������������";
				}	
			}			
		}else{
			if(sendflag==0){
				//orderstatus=3;
				orderstatus="�Ѹ��� �ȴ�����";
			}else{
				if(received==1){
					//orderstatus=4;
					orderstatus="���׳ɹ�";
				}else{
					//orderstatus=5;
					orderstatus="�Ѹ��� �ѷ���";
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
					//orderstatus="δ����";	
				}else{
				orderstatus=2;
					//orderstatus="������������";
				}	
			}			
		}else{
			if(sendflag==0){
				orderstatus=3;
				//orderstatus="�Ѹ��� �ȴ�����";
			}else{
				if(received==1){
					orderstatus=4;
					//orderstatus="���׳ɹ�";
				}else{
					orderstatus=5;
					//orderstatus="�Ѹ��� �ѷ���";
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
		  // ת��Ϊ��׼ʱ��
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
