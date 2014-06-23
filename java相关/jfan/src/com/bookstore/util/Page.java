package com.bookstore.util;
import java.util.List;
public class Page {
	private List elements;   
    private int pageSize;   
    private int pageNumber;   
    private int totalElements = 0;  
    
    
    /**  
     * 构建HibernatePage对象，完成Hibernate的Query数据的分页处理  
     *  
     * @param query  
     *            Hibernate的Query对象  
     * @param pageNumber  
     *            当前页编码，从1开始，如果传的值为Integer.MAX_VALUE表示获取最后一页。  
     *            如果你不知道最后一页编码，传Integer.MAX_VALUE即可。如果当前页超过总页数，也表示最后一页。  
     *            这两种情况将重新更改当前页的页码，为最后一页编码。  
     * @param pageSize  
     *            每一页显示的条目数  
     */  
    public Page(int pageNumber, int pageSize   ,int totalcount , List list ) {   
        this.pageNumber = pageNumber;   
        this.pageSize = pageSize;   
        this.totalElements = totalcount;   
        this.elements = list;
    }   
    
    //是否为第一页
    public boolean isFirst() {   
        return getPageNumber() == 1;   
    }   
    //是否为最后一页
    public boolean isLast() {   
        return getPageNumber() >= getLastPageNumber();   
    }   
  
    //是否有下一页
    public boolean hasNext() {   
        return getLastPageNumber() > getPageNumber();   
    }   
  //是否有上一页
    public boolean hasPrevious() {   
        return getPageNumber() > 1;   
    }   
  //获取最后一页页码 也就是总页数
    public int getLastPageNumber() {   
        return totalElements % this.pageSize == 0 ? totalElements / this.pageSize : totalElements / this.pageSize + 1;   
    }   
  
    /**  
     * 返回List类型数据  
     *  
     * @return List数据源  
     */  
    public List getThisPageElements() {   
        return elements;   
    }   
  //获取总的条数
    public int getTotalNumberOfElements() {   
        return totalElements;   
    }   
  //获取当前页 首条的条码
    public int getFirstElementNumber() {   
        return (getPageNumber() - 1) * getPageSize() + 1;   
    }   
  ////获取当前页 最后条的条码
    public int getLastElementNumber() {   
        int fullPage = getFirstElementNumber() + getPageSize() - 1;   
        return getTotalNumberOfElements() < fullPage ? getTotalNumberOfElements()   
                : fullPage;   
    }   
  //下一页编码
    public int getNextPageNumber() {   
        return getPageNumber() + 1;   
    }   
  //上一页编码
    public int getPreviousPageNumber() {   
        return getPageNumber() - 1;   
    }   
  //每页显示的条数
    public int getPageSize() {   
        return pageSize;   
    }   
  //获取当前页编码
    public int getPageNumber() {   
        return pageNumber;   
    }   
}
