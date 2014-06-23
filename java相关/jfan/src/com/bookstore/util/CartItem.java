package com.bookstore.util;

import com.bookstore.po.Gods;

/**
 * ���ﳵ�еĹ������������Ʒ����Ʒ����
 */
public class CartItem {
	
	private Gods gods;
	
	private int count;//�������
	
	public CartItem(Gods gods){		
		this.gods=gods;
		count++;
	}
	
	public Gods getGods() {
		return gods;
	}
	
	public void setGods(Gods gods) {
		this.gods = gods;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	//����ĳһ��������ܼ�
	public float getItemPrice(){
		
		float price = Float.valueOf(gods.getNewprice().toString())*count;
		return price;
	}
}
