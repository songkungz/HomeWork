package com.gz.bean;

public class Page {

	private int pageSize = 10;//页面数据条数
	private int pageNow = 1;//当前页数
	private int totalCount;//数据总条数
	private int totalPageCount;//总页数
	private int startPos; // 开始位置，从0开始
	private boolean hasFirst;// 是否有首页
	private boolean hasPre;// 是否有前一页
	private boolean hasNext;// 是否有下一页
	private boolean hasLast;// 是否有最后一页
	public Page() {
		super();
	}
	public Page(int totalCount, int pageNow) {
		this.totalCount = totalCount;
		this.pageNow = pageNow;
	}
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getStartPos() {
		return (pageNow - 1) * pageSize;
	}
	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}
	public boolean isHasFirst() {
		return (pageNow == 1) ? false : true;
	}
	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}
	public boolean isHasPre() {
		return isHasFirst() ? true : false;
	}
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public boolean isHasNext() {
		return isHasLast() ? true : false;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public boolean isHasLast() {
		return hasLast;
	}
	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
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
