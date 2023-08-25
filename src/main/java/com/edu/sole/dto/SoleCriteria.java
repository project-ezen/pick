package com.edu.sole.dto;

//----------------------------------------------------------------------------------------------------
//public class Criteria
//----------------------------------------------------------------------------------------------------
public class SoleCriteria {
	
	private int page;  			// 현재 페이지 번호           2
	private int perPageNum; 	// 한 페이지 당 보여줄 글의 갯수 3
	
	/*
	 * 게시글이 0으로 시작할 경우
	 * 현재 페이지의 게시글 시작 번호 = (현제 페이지 번호 -1) * 페이지당 보여줄 게시글의 개수
	 * 
	 * 현재 페이지 번호/ 페이지당 보여줄 게시글 수 / 계산식      /  게시글 시작 행 번호
	 * 3          /         5          / (3-1) *5  /   10
	 * 8		  /			10		   / (8-1) *10 /   70
	 * 14		  /         10         / (14-1)*10 /   130             인덱스 번호가 0부터 시작해서 1을 뺌
	 
	 *    3       /         10         /   (3-1) * 10 /    게시글 행 시작 번호는 : 
	 *    1 페이지 1 2 3 4 5 6 7 8 9 10
	 *    2 페이지 11 12 13 14 15 16 17 18 19 20
	 *    3 페이지 21 22 23 24 25 26 27 28 29 30    이기 때문에  
	 *    (3-1[1페이지에선 1 2페이지에선 11로 시작하기 때문에 현재 페이지 번호에서 -1해야함]) * 10 + 1[페이지 번호가 1로 시작한다 가정할때 +1 안하면 0부터 시작됨] 해야 21
	 */
	
	// 현재 페이지의 시작 글 번호
	public int getPageStart() {
		return (this.page-1) * perPageNum + 1;
	}
	
	// 기본 생성자
	public SoleCriteria() {
		// 최초 게시판에 진입할 때를 위해서 기본 값을 설정해야 한다.
		this.page 		= 1;
		this.perPageNum = 16;
	}
	
	public int getPage() {
		return page;
	}
	
	// 페이지가 음수값이 되지 않게 설정, 음수가 나오면 1페이지를 나타나게 한다.
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
		int OriginalCnt = this.perPageNum;
		
		if(pageCount != OriginalCnt) {
			this.perPageNum = OriginalCnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
}  // end - class Criteria