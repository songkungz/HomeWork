package com.gz.bean;

import java.util.List;

public class Page<T> {

	private int pageSize ;//页面数据条数
	private int pageNow;//当前页数
	private int totalCount;//数据总条数
	private int totalPageCount;//总页数
	private int startPos; // 开始位置，从0开始
	private int start;//开始页数
	private int end;//结尾页数
	private List<T> list;
	
	public Page() {
		super();
	}
	public Page(int totalCount, int pageNow,int pageSize) {
		 this.pageSize = pageSize;
		//数据总页数
		System.out.println("totalCount:"+totalCount+"pageNow:"+pageNow+"pageSize:"+pageSize);
		if(totalCount%pageSize==0) {
		      this.totalPageCount = totalCount/pageSize;
		}
		else {
			 this.totalPageCount = totalCount/pageSize+1;
		}
		if(pageNow<=1)
		{
			this.pageNow = 1;
		}
		else if(pageNow>=totalPageCount) {
			this.pageNow = totalPageCount;
		}
		else
		{
			this.pageNow = pageNow;
		}
		this.startPos = pageSize*(pageNow-1);//查询开始索引
		//设置显示页数
		this.start = 1;
		this.end = 5;
		if(totalPageCount<5)
			//总页数都小于5，那么end就为总页数的值了。
				this.end = totalPageCount;
		else {
			 this.start = pageNow - 2;
			 this.end = pageNow + 2;
			 if(start<0)
			 {
				 this.start = 1;
				 this.end = 5;
			 }
			 if(end > totalPageCount)
			 {
				 this.start = totalPageCount;
				 this.end = totalPageCount;
			 }
		}
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
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", pageNow=" + pageNow + ", totalCount=" + totalCount
				+ ", totalPageCount=" + totalPageCount + ", startPos=" + startPos + ", start=" + start + ", end=" + end
				+ ", list=" + list + "]";
	}
	
}
