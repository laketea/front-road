package com.bookstore.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import com.bookstore.po.Gods;

public class Cart {
	private HashMap<Integer, CartItem> items = null;

	private int itemsCount = 0;//购物项的数量
	
	public Cart() {
		items = new HashMap<Integer, CartItem>();
	}

	/**
	 * 在购物车中添加一个购物项，如果该购物项已存在购物车中，则什么都不做
	 * @param bookId 书籍的Id号
	 * @param book 书
	 */
	public synchronized void addItem(Integer godsid,Gods gods) {
		if(!items.containsKey(godsid)) {//购物车中没有该商品，可以添加该商品到购物车中
			CartItem item = new CartItem(gods);
			items.put(godsid, item);
			itemsCount++;
		}
	}
	/**
	 * 修改已经购买好的书籍数量
	 * @param bookId 书籍的Id号
	 * @param count 修改后的数量
	 */
	public synchronized void updateGodsCount(Integer bookId,int count){
		if(count >= 1){
			if(items.containsKey(bookId)){
				CartItem item = items.get(bookId);//根据书的Id号，来得到此书
				item.setCount(count);//修改书的数量
			}
		}
	}
	/**
	 * 从购物车中删除一个购物项
	 * @param bookId 书籍的Id号
	 */
	public synchronized void deleteItem(Integer bookId){
		if(items.containsKey(bookId)){
			items.remove(bookId);
			itemsCount--;
		}
	}
	/**
	 * 删除购物车中的所有购物项
	 */
	public synchronized void clear(){
		items.clear();
		itemsCount = 0;
	}
	/**
	 * 得到购物车中的所有购物项的数目
	 */
	public synchronized int getItemCount(){
		return itemsCount;
	}
	/**
	 * 得到购物车中的所有购物项的总价格
	 */
	public synchronized float getTotalPrice(){
		float amount = 0.0f;
		//得到迭代器
		Iterator<CartItem> it = items.values().iterator();
		while(it.hasNext()){
			CartItem item = it.next();
			amount+=item.getItemPrice();
		}
		return amount;
	}
	/**
	 * 得到购物车中的所有商品
	 */
	 public synchronized Collection<CartItem> getItems(){
		 return items.values();
	 }
	 /**
	  * 判断商品是否在购物车中
	  */
	 public synchronized boolean isExist(Integer bookId){
		 if(items.containsKey(bookId)){
			 return true;
		 }
		 return false;
	 }
}
