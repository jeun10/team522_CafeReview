package com.project522.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewVO;
import com.project522.domain.TagVO;
import com.project522.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private ReviewMapper mapper; // 주입받는 생성자를 만든다.

	@Override
	public void register(ReviewVO reviewvo) throws Exception {
		log.info("register------" + reviewvo);
		mapper.insertReview(reviewvo);
	}

	@Override
	public List<TagVO> getReviewTagList1(TagVO tagvo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getReviewTag1(tagvo);
	}

	@Override
	public List<TagVO> getReviewTagList2(TagVO tagvo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getReviewTag2(tagvo);
	}

	@Override
	public List<TagVO> getReviewTagList3(TagVO tagvo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getReviewTag3(tagvo);
	}

//	@Override
//	public List<TagVO> getReviewTagList4(TagVO tagvo) throws Exception {
//		// TODO Auto-generated method stub
//		return mapper.getReviewTag4(tagvo);
//	}
	@Override
	public ReviewVO getReview(int review_Num) {
		// TODO Auto-generated method stub
		log.info("get......" + review_Num);
		return mapper.get(review_Num);
	}
	
	@Override
	public List<ReviewVO> getReviewPag(ReviewCriteria cri) {
		// TODO Auto-generated method stub
		log.info("get......" + cri);
		return mapper.getReviewListWithPaging(cri);
	}
	
	@Override
	public int getCReviewCount(ReviewCriteria cri) {
		// TODO Auto-generated method stub
		log.info("get review count......"+cri);

		return mapper.getReviewCount(cri);
	}
	
	
	@Override
	public int delReview(int review_Num) {
		log.info("delete......"+review_Num);
		return mapper.deleteReview(review_Num);
	}

	@Override
	public int modiReview(ReviewVO reviewvo) {
		// TODO Auto-generated method stub
		log.info("modify......"+reviewvo);

		return mapper.modifyReview(reviewvo);
	}

	@Override
	public int modiReviewImg(ReviewVO reviewvo) {
		// TODO Auto-generated method stub
		log.info("modifywithImage......"+reviewvo);

		return mapper.modifyReview_img(reviewvo);
	}

	@Override
	public String getReviewNickname(int review_Num) {
		log.info("getReviewNickname......"+review_Num);

		return mapper.getReviewNickname(review_Num);
	}

	@Override
	public List<ReviewVO> getHashPag(ReviewCriteria cri) {
		log.info("get......" + cri);
		return mapper.getHashListWithPaging(cri);
	}

	@Override
	public int getHashCount(ReviewCriteria cri) {
		// TODO Auto-generated method stub
		log.info("get Hash count......"+cri);

		return mapper.getHashCount(cri);
	}



}
