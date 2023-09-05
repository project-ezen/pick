package com.edu.board.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.member.dto.MemberDTO;

@Component("boardDTO")
public class BoardDTO {
	
	private int recNum;
	private int board_id;
	private String title;
	private String content;
	private Date writeDate;
	private String image;
	private String writer;
	private String nickname;
	private String thumbnail;
	private int reply_num;
	
	private MemberDTO memberDTO;

	
	public int getRecNum() {
		return recNum;
	}

	public void setRecNum(int recNum) {
		this.recNum = recNum;
	}

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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "BoardDTO [recNum=" + recNum + ", board_id=" + board_id + ", title=" + title + ", content=" + content
				+ ", writeDate=" + writeDate + ", image=" + image + ", writer=" + writer + ", nickname=" + nickname
				+ ", thumbnail=" + thumbnail + ", reply_num=" + reply_num + ", memberDTO=" + memberDTO + "]";
	}

	
}
