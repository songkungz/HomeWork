package com.gz.bean;

public class Page {
	private int pageSize = 10;//页面数据条数
	private int pageNow;//当前页数
	private int totalCount;//数据总条数
	private int totalPageCount;//总页数
	private int startPos; // 开始位置，从0开始
	
	public Page() {
		super();
	}
	public Page(int totalCount, int pageNow) {
		this.totalCount = totalCount;
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}
	public int getStartPos() {
		return startPos;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalCount() {				
		return  totalCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getTotalPageCount() {				
		return  totalPageCount;
	}
	
}
