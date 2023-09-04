package com.edu.store.dto;

public class ReviewDTO {
	private String review_id;
	private String display_product_id;
	private String content;
	private String image;
	private String writeDate;
	private String member_id;
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getDisplay_product_id() {
		return display_product_id;
	}
	public void setDisplay_product_id(String display_product_id) {
		this.display_product_id = display_product_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReviewDTO [review_id=" + review_id + ", display_product_id=" + display_product_id + ", content="
				+ content + ", image=" + image + ", writeDate=" + writeDate + ", member_id=" + member_id + "]";
	}
	

	
	
}
