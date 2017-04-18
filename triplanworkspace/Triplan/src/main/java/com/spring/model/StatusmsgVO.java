package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

public class StatusmsgVO {

	private String userid;
	private String statusmsg;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStatusmsg() {
		return statusmsg;
	}
	public void setStatusmsg(String statusmsg) {
		this.statusmsg = statusmsg;
	}
	
	
	private String filename;
	private String orgFileName;
	private String fileSize;
	
	private MultipartFile attach;

	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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


	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	
}
