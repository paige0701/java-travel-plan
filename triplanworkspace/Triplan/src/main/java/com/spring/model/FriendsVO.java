package com.spring.model;

public class FriendsVO {

	private String id1;
	private String id2;
	
	public FriendsVO()
	{
		
	}
	
	public FriendsVO(String id1, String id2)
	{
		this.id1 = id1;
		this.id2 = id2;
	}

	public String getId1() {
		return id1;
	}

	public void setId1(String id1) {
		this.id1 = id1;
	}

	public String getId2() {
		return id2;
	}

	public void setId2(String id2) {
		this.id2 = id2;
	}

}
