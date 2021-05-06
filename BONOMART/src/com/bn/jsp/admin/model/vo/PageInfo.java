package com.bn.jsp.admin.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable {
	
	private int startPage;  // 시작 페이지  (1), 2, 3, 4, 5 . . . . 20
	private int endPage;    // 끝 페이지    1, 2, 3, 4, (5) . . . . 20
	private int maxPage;   // 실제 끝 페이지 1, 2, 3, 4, 5 . . . . (20)
	private int currentPage;  // 현재 페이지
	private int limit = 10;      // 한번에 보여줄 페이지 수
	private int listCount; // 총 게시글 수
	private String type;
	private String content;
	
	public PageInfo() { }

	
	
	public PageInfo(int startPage, int endPage, int maxPage, int currentPage, int limit, int listCount, String type,
			String content) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.currentPage = currentPage;
		this.limit = limit;
		this.listCount = listCount;
		this.type = type;
		this.content = content;
	}



	public PageInfo(int startPage, int endPage, int maxPage, int currentPage, int limit, int listCount) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.currentPage = currentPage;
		this.limit = limit;
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "PageInfo [startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", currentPage="
				+ currentPage + ", limit=" + limit + ", listCount=" + listCount + "]";
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}
	
	
}
