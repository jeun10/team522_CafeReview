package com.project522.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyPageCriteria {

	private int pageNum;
	private int amount;
	private String user_id;
	
	public MyPageCriteria() {
		this(1, 5);
	}
	
	public MyPageCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/*
	 * public MyPageCriteria(int pageNum, int amount) { this.pageNum = pageNum;
	 * this.amount = amount; this.user_id = user_id; }
	 */
}
