package com.edu.board.dto;

import java.sql.Date;

public class ReplyDTO {

		private int 	replyNum;
		private int 	board_id;
		private String  r_writer;
		private String 	content;
		private Date 	writeDate;
		
		public int getReplyNum() {
			return replyNum;
		}
		public void setReplyNum(int replyNum) {
			this.replyNum = replyNum;
		}
		
		public int getBoard_id() {
			return board_id;
		}
		public void setBoard_id(int board_id) {
			this.board_id = board_id;
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
		
		@Override
		public String toString() {
			return "ReplyDTO [replyNum=" + replyNum + ", board_id=" + board_id + ", r_writer=" + r_writer + ", content="
					+ content + ", writeDate=" + writeDate + "]";
		}
		
		
}
