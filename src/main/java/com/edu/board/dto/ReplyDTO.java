package com.edu.board.dto;

import java.sql.Date;

public class ReplyDTO {

	private Integer replyNum;
	private Integer b_id;
	private String  r_writer;
	private String 	content;
	private Date 	writeDate;
	private String 	nickname;
	
	public Integer getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Integer replyNum) {
		this.replyNum = replyNum;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyNum=" + replyNum + ", b_id=" + b_id + ", r_writer=" + r_writer + ", content="
				+ content + ", writeDate=" + writeDate + ", nickname=" + nickname + "]";
	}
	
	
	
}