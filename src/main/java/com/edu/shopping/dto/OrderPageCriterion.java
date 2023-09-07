package com.edu.shopping.dto;

public class OrderPageCriterion {
	private int page;			// 현재 페이지 번호
	private int perPageNum;		// 한 페이지당 보여줄 글의 개수

	/* 게시글이 0으로 시작할 경우
	 * 현재 페이지의 게시글 시작번호 = (현재 페이지 번호 - 1) * 페이지당 보여줄 게시글의 개수
	 * 현재 페이지 번호, 페이지당 보여줄 게시글 수, 계산식, 게시글 시작 행 번호
	 * 3, 5, (3-1) * 5, 10
	 * 8, 10, (8-1) * 10, 70
	 * 14, 10, (14-1) * 10, 130
	 */
	
	// 현재 페이지의 시작 글 번호
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	// basic_constructor
	public OrderPageCriterion() {
		// 최초 개시판에 진입할 때를 위해서 기본 값을 설정해야 한다.
		this.page = 1;
		this.perPageNum = 3;
	}
	
	public int getPage() {
		return page;
	}
	// 페이지가 음수 값이 되지 않게 설정. 음수가 되면 1페이지를 나타낸다.
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	// 페이지당 보여줄 게시글 수가 변하지 않게 설정한다.
	public void setPerPageNum(int pageCount) {
		int Originalcnt = this.perPageNum;
		
		if(pageCount != Originalcnt) {
			this.perPageNum = Originalcnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
