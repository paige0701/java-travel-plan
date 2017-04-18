package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	// #10. VO에 멤버변수 설정(Properity 설정하기)
	//      오라클에서 생성한 tblBoard 테이블의 컬럼을 설정해주는 것이다.
	//      오라클에서 tblBoard 테이블을 생성한 후 돌아온다.
	
	private String seq;
	private String userid;
	private String subject;
	private String content;
	private String pw;
	private String readCount;
	private String regDate;

	// #64. 오라클에서 tblBoard 테이블에 댓글갯수를 알려주는 
	//       commentCount 컬럼이 추가함에 따라 
	//       멤버변수 String commentCount 추가 및 getter, setter 추가하기
	private String commentCount;
		
	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

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
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getReadCount() {
		return readCount;
	}
	
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	// #96. 답변형 게시판을 위한 멤버변수 추가하기
	//      먼저, 오라클에서 tblBoard 테이블과 tblComment 테이블을 
	//      기존것은 제거한 후 새로이 만들고서 아래와 같이 한다.
	private String groupno;
	/* 답변글쓰기에 있어서 그룹번호
             원글(부모글)과 답변글은 동일한 groupno 를 가진다.
             답변글이 아닌 원글(부모글)을 경우 groupno 의 값은
       groupno 컬럼의 최대값(max)+1 로 한다.
    */
	
	private String fk_seq;
	/* fk_seq 컬럼은 절대로 foreign key 가 아니다.
       fk_seq 컬럼은 자신의 글(답변글)에 있어서
             원글(부모글)이 누구인지에 대한 정보값이다.
             답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은
             원글(부모글)의 seq 컬럼의 값을 가지게 되며,
             답변글이 아닌 원글일 경우 0 을 가지지도록 할 것이다. 
	 */
	
	private String depthno;
	/* 답변글쓰기에 있어서 답변글 이라면
             원글(부모글)의 depthno + 1 을 가지게 되며
             답변글이 아닌 원글일 경우 0 을 가지도록 한다.
	 */

	public String getGroupno() {
		return groupno;
	}

	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	public String getFk_seq() {
		return fk_seq;
	}

	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	
	
	// #114. 파일첨부를 하도록  VO 수정하기
	//       멤버변수 MultipartFile attach,
	//              String fileName, 
	//              String orgFileName,
	//              String fileSize 추가 한후 
	//       getter, setter 해준다.
	
	//  먼저, 오라클 데이터베이스에서 tblBoard 테이블에 
	/*       3개의 컬럼을 추가해주어야 한다. 
	 
      alter table tblBoard
      add fileName  varchar2(255);
      -- 웹서버에 저장될 파일명(201606093776543535325235325546256.png)

      alter table tblBoard
      add orgFileName varchar2(255);
      -- 진짜 파일명(강아지.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 

      alter table tblBoard
      add fileSize number;  -- 파일크기 
	 */
	
	// MultipartFile attach 은 DB의 tblBoard 테이블의 컬럼이 아니다.!!!!
	private MultipartFile attach; // 진짜 파일 -->웹서버 하드디스크에 저장됨. 
	
	private String fileName; // 웹서버 디스크에 저장될 파일명(201606093776543535325235325546256.png) 
	private String orgFileName; // 진짜 파일명(강아지.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
	private String fileSize; // 파일크기 

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
}






