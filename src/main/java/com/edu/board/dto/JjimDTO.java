package com.edu.board.dto;

public class JjimDTO {
	
	private int jjim_id;
	private int board_id;
	private String m_id;
	
	public int getJjim_id() {
		return jjim_id;
	}
	public void setJjim_id(int jjim_id) {
		this.jjim_id = jjim_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "JjimDTO [jjim_id=" + jjim_id + ", board_id=" + board_id + ", m_id=" + m_id + "]";
	}
	
}
