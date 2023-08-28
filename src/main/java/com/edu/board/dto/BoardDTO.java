package com.edu.board.dto;

import java.sql.Date;

public class BoardDTO {
	
	private int 	b_id;	// 연결할 고유글번호
	private String 	title;
	private String 	content;
	private Date 	writeDate;
	private String 	image;
	private String 	id;
	
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "boardDTO [b_id=" + b_id + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", image=" + image + ", id=" + id + "]";
	}
	
}
