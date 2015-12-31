package com.valueline.module.data.util;
import java.io.Serializable;
import java.util.List;

public class Pagination<T> implements Serializable{
	private static final long serialVersionUID = 1L;
	//总记录数
	private int totalCount;
	//总页数
	private int totalPage;
	//每页条数
	private int pageSize = 10;
	//当前页数
	private int currentPage = 1;
	//开始记录
	private int startCount;
	//查询结果
	private List<T> queryData;
	
	public int getStartCount(){
		return this.startCount;
	}
	//计算开始记录
	public void setStartCount() {
		this.startCount = (this.currentPage - 1) * this.pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage() {
		 if (totalCount % pageSize == 0) { 
             totalPage = totalCount / pageSize;    
         } else {    
             totalPage = totalCount / pageSize + 1;    
         }    
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<T> getQueryData() {
		return queryData;
	}
	public void setQueryData(List<T> queryData) {
		this.queryData = queryData;
	}
	@Override
	public String toString() {
		return "Pagination [totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", pageSize=" + pageSize + ", currentPage="
				+ currentPage + ", startCount=" + startCount + ", endCount="
				+ ", queryData=" + queryData + "]";
	}
}
