package com.spring.model;

// #62. 댓글용 VO 생성하기
public class CommentVO {

	private String seq;       // 댓글번호
	private String userid;      // 성명
	private String content;   // 댓글 내용
	private String regDate;   // 시간
	private String parentSeq; // 원게시물 글번호
	
	public String getSeq() {
		return seq;
	}
	
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getParentSeq() {
		return parentSeq;
	}
	
	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}
	
}
