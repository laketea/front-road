package com.bookstore.util;
import java.util.List;
public class Page {
	private List elements;   
    private int pageSize;   
    private int pageNumber;   
    private int totalElements = 0;  
    
    
    /**  
     * ����HibernatePage�������Hibernate��Query���ݵķ�ҳ����  
     *  
     * @param query  
     *            Hibernate��Query����  
     * @param pageNumber  
     *            ��ǰҳ���룬��1��ʼ���������ֵΪInteger.MAX_VALUE��ʾ��ȡ���һҳ��  
     *            ����㲻֪�����һҳ���룬��Integer.MAX_VALUE���ɡ������ǰҳ������ҳ����Ҳ��ʾ���һҳ��  
     *            ��������������¸��ĵ�ǰҳ��ҳ�룬Ϊ���һҳ���롣  
     * @param pageSize  
     *            ÿһҳ��ʾ����Ŀ��  
     */  
    public Page(int pageNumber, int pageSize   ,int totalcount , List list ) {   
        this.pageNumber = pageNumber;   
        this.pageSize = pageSize;   
        this.totalElements = totalcount;   
        this.elements = list;
    }   
    
    //�Ƿ�Ϊ��һҳ
    public boolean isFirst() {   
        return getPageNumber() == 1;   
    }   
    //�Ƿ�Ϊ���һҳ
    public boolean isLast() {   
        return getPageNumber() >= getLastPageNumber();   
    }   
  
    //�Ƿ�����һҳ
    public boolean hasNext() {   
        return getLastPageNumber() > getPageNumber();   
    }   
  //�Ƿ�����һҳ
    public boolean hasPrevious() {   
        return getPageNumber() > 1;   
    }   
  //��ȡ���һҳҳ�� Ҳ������ҳ��
    public int getLastPageNumber() {   
        return totalElements % this.pageSize == 0 ? totalElements / this.pageSize : totalElements / this.pageSize + 1;   
    }   
  
    /**  
     * ����List��������  
     *  
     * @return List����Դ  
     */  
    public List getThisPageElements() {   
        return elements;   
    }   
  //��ȡ�ܵ�����
    public int getTotalNumberOfElements() {   
        return totalElements;   
    }   
  //��ȡ��ǰҳ ����������
    public int getFirstElementNumber() {   
        return (getPageNumber() - 1) * getPageSize() + 1;   
    }   
  ////��ȡ��ǰҳ �����������
    public int getLastElementNumber() {   
        int fullPage = getFirstElementNumber() + getPageSize() - 1;   
        return getTotalNumberOfElements() < fullPage ? getTotalNumberOfElements()   
                : fullPage;   
    }   
  //��һҳ����
    public int getNextPageNumber() {   
        return getPageNumber() + 1;   
    }   
  //��һҳ����
    public int getPreviousPageNumber() {   
        return getPageNumber() - 1;   
    }   
  //ÿҳ��ʾ������
    public int getPageSize() {   
        return pageSize;   
    }   
  //��ȡ��ǰҳ����
    public int getPageNumber() {   
        return pageNumber;   
    }   
}
