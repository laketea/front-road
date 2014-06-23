package com.bookstore.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import com.bookstore.po.Gods;

public class Cart {
	private HashMap<Integer, CartItem> items = null;

	private int itemsCount = 0;//�����������
	
	public Cart() {
		items = new HashMap<Integer, CartItem>();
	}

	/**
	 * �ڹ��ﳵ�����һ�����������ù������Ѵ��ڹ��ﳵ�У���ʲô������
	 * @param bookId �鼮��Id��
	 * @param book ��
	 */
	public synchronized void addItem(Integer godsid,Gods gods) {
		if(!items.containsKey(godsid)) {//���ﳵ��û�и���Ʒ��������Ӹ���Ʒ�����ﳵ��
			CartItem item = new CartItem(gods);
			items.put(godsid, item);
			itemsCount++;
		}
	}
	/**
	 * �޸��Ѿ�����õ��鼮����
	 * @param bookId �鼮��Id��
	 * @param count �޸ĺ������
	 */
	public synchronized void updateGodsCount(Integer bookId,int count){
		if(count >= 1){
			if(items.containsKey(bookId)){
				CartItem item = items.get(bookId);//�������Id�ţ����õ�����
				item.setCount(count);//�޸��������
			}
		}
	}
	/**
	 * �ӹ��ﳵ��ɾ��һ��������
	 * @param bookId �鼮��Id��
	 */
	public synchronized void deleteItem(Integer bookId){
		if(items.containsKey(bookId)){
			items.remove(bookId);
			itemsCount--;
		}
	}
	/**
	 * ɾ�����ﳵ�е����й�����
	 */
	public synchronized void clear(){
		items.clear();
		itemsCount = 0;
	}
	/**
	 * �õ����ﳵ�е����й��������Ŀ
	 */
	public synchronized int getItemCount(){
		return itemsCount;
	}
	/**
	 * �õ����ﳵ�е����й�������ܼ۸�
	 */
	public synchronized float getTotalPrice(){
		float amount = 0.0f;
		//�õ�������
		Iterator<CartItem> it = items.values().iterator();
		while(it.hasNext()){
			CartItem item = it.next();
			amount+=item.getItemPrice();
		}
		return amount;
	}
	/**
	 * �õ����ﳵ�е�������Ʒ
	 */
	 public synchronized Collection<CartItem> getItems(){
		 return items.values();
	 }
	 /**
	  * �ж���Ʒ�Ƿ��ڹ��ﳵ��
	  */
	 public synchronized boolean isExist(Integer bookId){
		 if(items.containsKey(bookId)){
			 return true;
		 }
		 return false;
	 }
}
