package com.project522.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyPagePageDTO {
	public MyPagePageDTO(MyPageCriteria cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;
		this.startPage = this.endPage - 4;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

	private int startPage; // ����������
	private int endPage; // ��������
	private boolean prev, next; // ����, ���� ������

	private int total; // �ѵ����ͼ�
	private MyPageCriteria cri; // ����¡
	private String user_id;
	/*
	 * public MyPagePageDTO(MyPageCriteria cri, int total) { this.cri = cri;
	 * this.total = total;
	 * 
	 * this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5; this.startPage
	 * = this.endPage - 4;
	 * 
	 * int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
	 * 
	 * if (realEnd < this.endPage) { this.endPage = realEnd; }
	 * 
	 * this.prev = this.startPage > 1; this.next = this.endPage < realEnd;
	 * 
	 * }
	 */

	public MyPagePageDTO() {

	}

}
