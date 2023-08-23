package com.edu.board.dto;

import java.sql.Date;

public class boardDTO {
	
	private int id;	// 연결할 고유글번호
	private String title;
	private String content;
	private int articleNO;	//글순번
	private Date writeDate;
	private String image;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "boardDTO [id=" + id + ", title=" + title + ", content=" + content + ", articleNO=" + articleNO
				+ ", writeDate=" + writeDate + ", image=" + image + "]";
	}
	
	
}
