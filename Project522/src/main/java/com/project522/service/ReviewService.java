package com.project522.service;

import java.util.List;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewVO;
import com.project522.domain.TagVO;

public interface ReviewService {
	public void register(ReviewVO reviewvo) throws Exception;
	public List<TagVO> getReviewTagList1(TagVO tagvo) throws Exception;
	public List<TagVO> getReviewTagList2(TagVO tagvo) throws Exception;
	public List<TagVO> getReviewTagList3(TagVO tagvo) throws Exception;
//	public List<TagVO> getReviewTagList4(TagVO tagvo) throws Exception;
	public ReviewVO getReview(int review_Num);
	
	public List<ReviewVO> getReviewPag(ReviewCriteria cri);
	public List<ReviewVO> getHashPag(ReviewCriteria cri);
	
	public int getCReviewCount(ReviewCriteria cri);
	public int getHashCount(ReviewCriteria cri);
	
	public String getReviewNickname(int review_Num);
	
	public int delReview(int review_Num);
	public int modiReview(ReviewVO reviewvo);
	public int modiReviewImg(ReviewVO reviewvo);

}
