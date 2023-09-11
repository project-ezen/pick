package com.edu.board.dto;

public class JjimDTO {
	
	private int jjim_id;
	private int b_id;
	private String mem_id;
	private int j_check;
	
	public int getJjim_id() {
		return jjim_id;
	}
	public void setJjim_id(int jjim_id) {
		this.jjim_id = jjim_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getJ_check() {
		return j_check;
	}
	public void setJ_check(int j_check) {
		this.j_check = j_check;
	}
	@Override
	public String toString() {
		return "LikedDTO [jjim_id=" + jjim_id + ", b_id=" + b_id + ", mem_id=" + mem_id + ", j_check=" + j_check + "]";
	}
	
}
