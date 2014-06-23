package com.bookstore.util;

import com.bookstore.po.Gods;

/**
 * 购物车中的购物项，它包括商品和商品数量
 */
public class CartItem {
	
	private Gods gods;
	
	private int count;//书的数量
	
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
	//计算某一购物项的总价
	public float getItemPrice(){
		
		float price = Float.valueOf(gods.getNewprice().toString())*count;
		return price;
	}
}
