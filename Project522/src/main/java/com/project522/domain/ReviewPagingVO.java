package com.project522.domain;


import lombok.Data;

@Data
public class ReviewPagingVO {	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int startPage;// 시작페이지
	private int endPage; // 끝 페이지
	private boolean prev, next; // 이전 다음 페이지

	private int total; // 총 데이터 수
	private ReviewCriteria cri; // 페이징

	public ReviewPagingVO(ReviewCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
