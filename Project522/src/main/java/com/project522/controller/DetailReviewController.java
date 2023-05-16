package com.project522.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewPagingVO;
import com.project522.domain.ReviewVO;
import com.project522.mapper.ReviewMapper;
import com.project522.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class DetailReviewController {
	
	
	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private ReviewService service;
	// 리뷰 세부 리스트 화면
	@GetMapping("/DetailReview")
	public String DetailReview(@RequestParam("review_Cafename") String review_Cafename, Model model,ReviewCriteria cri) {
	   
		/*
		 * List<ReviewVO> List = mapper.getReviewListByCafename(review_Cafename);
		 * model.addAttribute("List", List);
		 * 
		 * if (List != null) { model.addAttribute("List", List); }
		 */
		cri.setReview_Cafename(review_Cafename);
		log.info("list:"+cri);
		
		model.addAttribute("List", service.getReviewPag(cri) );
		model.addAttribute("SearchContent", review_Cafename );

		//model.addAttribute("pageMaker",new ReviewPagingVO(cri,20));
		int total=service.getCReviewCount(cri);
		log.info("total="+total);
		model.addAttribute("pageMaker",new ReviewPagingVO(cri,total));
	    return "review/DetailReview";
	}
	
	@GetMapping("/HashReview")
	public String HashReview(@RequestParam("review_Hashtag") String review_Hashtag, Model model,ReviewCriteria cri) {

		cri.setReview_Hashtag(review_Hashtag);
		log.info("list:"+cri);

		model.addAttribute("List", service.getHashPag(cri) );
		model.addAttribute("SearchContent", "#"+review_Hashtag );

		//model.addAttribute("pageMaker",new ReviewPagingVO(cri,20));
		int total=service.getHashCount(cri);
		log.info("total="+total);
		model.addAttribute("pageMaker",new ReviewPagingVO(cri,total));
	    return "review/HashReview";
	}

}
