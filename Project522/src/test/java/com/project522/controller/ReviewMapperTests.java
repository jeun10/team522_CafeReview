package com.project522.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewVO;
import com.project522.domain.TagVO;
import com.project522.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Autowired
	private ReviewMapper mapper;
	@Test
	public void testInsert() throws Exception {
		ReviewVO reviewvo = new ReviewVO();
		reviewvo.setReview_Num(1);
		reviewvo.setReview_Title("hello");
		reviewvo.setReview_Content("test123123123");
		mapper.insertReview(reviewvo);
		log.info(reviewvo);
	}
	 @Test
     public void testGetTagList() {
         TagVO tagvo= new TagVO();
         
         List<TagVO> list = mapper.getReviewTag1(tagvo);
 		log.info(list);

         
     }
	 @Test
     public void testDeleteReview() {
		 int rnum=2;
		 int result = mapper.deleteReview(rnum);
		 log.info("result:"+result);
     }
	 
	 @Test
     public void testModifyReview() {
		 int rnum=45;

		 ReviewVO reviewvo = new ReviewVO();
		 reviewvo=mapper.get(rnum);
		 log.info("수정전:"+reviewvo);

		 reviewvo.setReview_HashTag("해쉬태그 수정123123");
		 reviewvo.setReview_Title("수정테스트 제목 수정");
		 int result = mapper.modifyReview(reviewvo);
		 log.info("result:"+result);
		 log.info("수정 후:"+reviewvo);

     }
	 
	 @Test
	 public void testgetListPaging() {
		 ReviewCriteria cri = new ReviewCriteria();
		 cri.setAmount(5);
		 cri.setPageNum(1);
		 cri.setReview_Cafename("폴바셋 강남삼성타운점");
		 
		 List<ReviewVO> list = mapper.getReviewListWithPaging(cri);
		 log.info(list);
	 }
	 
	 @Test
	 public void getnickname() {
		 String list = mapper.getReviewNickname(55);
		 log.info(list);
		 log.info("11111111111111111");


	 }
	 @Test
	 public void getHashtagList() {
		 ReviewCriteria cri = new ReviewCriteria();
		 cri.setAmount(5);
		 cri.setPageNum(1);
		 cri.setReview_Hashtag("테스트");
		 
		 List<ReviewVO> list = mapper.getHashListWithPaging(cri);
		 log.info(list);

	 }
}
