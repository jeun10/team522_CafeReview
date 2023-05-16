package com.project522.domain;

import lombok.Data;

@Data
public class ReviewCriteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	private String review_Cafename;
	private String review_Hashtag;

	

	public ReviewCriteria() {
		this(1, 5);
	}

	public ReviewCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
