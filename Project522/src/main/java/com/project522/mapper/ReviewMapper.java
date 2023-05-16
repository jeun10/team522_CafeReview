package com.project522.mapper;

import java.util.List;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewVO;
import com.project522.domain.TagVO;

public interface ReviewMapper {
	public void insertReview(ReviewVO reviewvo) throws Exception;
	public List<TagVO> getReviewTag1(TagVO tagvo);
	public List<TagVO> getReviewTag2(TagVO tagvo);
	public List<TagVO> getReviewTag3(TagVO tagvo);
//	public List<TagVO> getReviewTag4(TagVO tagvo);
	
	
	// 카페이름 중복 제외 리스트 
	public List<ReviewVO> getReviewList(); 
	
	public List<ReviewVO> getDistinctByCafename (String review_Cafename);
	
	// 카페 이름 리스트 
	public List<ReviewVO> getReviewListByCafename(String review_Cafename);
	
	// 중복된 이름만 뽑는 전체 리스트 
	public List<ReviewVO> getDistinctList1();
	public List<ReviewVO> getDistinctList2();
	public List<ReviewVO> getDistinctList3();

	

	
	public ReviewVO get(int review_Num);
	
	public int deleteReview(int review_Num);
	public int modifyReview(ReviewVO reviewvo);
	public int modifyReview_img(ReviewVO reviewvo);
	
	public String getReviewNickname(int review_Num);
	
	//리뷰 리스트 페이징
	public List<ReviewVO> getReviewListWithPaging(ReviewCriteria cri);
	//클릭한 해시태그 리스트 페이징
	public List<ReviewVO> getHashListWithPaging(ReviewCriteria cri);
	
	//카페 리뷰 카운트
	public int getReviewCount(ReviewCriteria cri);
	public int getHashCount(ReviewCriteria cri);
	
	/*review 전체 조회(추가부분 2023.04.19)*/
	public List<ReviewVO> getAllReview();

}
