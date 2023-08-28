package com.edu.board.dto;

import java.sql.Date;

public class BoardDTO {
	
<<<<<<< HEAD
	private int board_id;
	private String title;
	private String content;
	private Date writeDate;
	private String image;
	private String m_id;
=======
	private int 	b_id;	// 연결할 고유글번호
	private String 	title;
	private String 	content;
	private Date 	writeDate;
	private String 	image;
	private String 	id;
>>>>>>> 4eac6f5c3f712778326c6c05268e67123e67033e
	
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "BoardDTO [board_id=" + board_id + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", image=" + image + ", m_id=" + m_id + "]";
	}
	
	
}
