package com.edu.board.dto;

public class JjimDTO {
	
	private String id;
	private boolean jjim;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isJjim() {
		return jjim;
	}
	public void setJjim(boolean jjim) {
		this.jjim = jjim;
	}
	
	@Override
	public String toString() {
		return "likedDTO [id=" + id + ", jjim=" + jjim + "]";
	}
	
}
