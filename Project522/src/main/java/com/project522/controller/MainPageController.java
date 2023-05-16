package com.project522.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project522.domain.ReviewVO;
import com.project522.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;



@Controller
@Log4j
public class MainPageController{

	@Autowired
	private ReviewMapper mapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main_Page(@RequestParam(defaultValue = "0") int page, Model model) throws Exception {
		
	
		int currentPage = page;
		int size = 8;
		int start = currentPage * size;
		int end = start + size;

		
		
		List<ReviewVO> List = mapper.getReviewList();
		
		System.out.println("List.size() : "+List.size());
		if (end > List.size()) {
		    end = start + (List.size() % size);
		}

		// 이전/다음 페이지 링크 생성 코드
		int totalPages = (int) Math.ceil((double) List.size() / size);
		
		
		int prevPage = currentPage - 1;
		int nextPage = currentPage + 1;
		boolean hasPrevPage = prevPage >= 0;
		boolean hasNextPage = end < List.size();

		System.out.println("모든 데이터 " +totalPages);
		// 데이터 처리 코드

		List<ReviewVO> Tag1 = mapper.getDistinctList1();
		List<ReviewVO> Tag2 = mapper.getDistinctList2();
		List<ReviewVO> Tag3 = mapper.getDistinctList3();


		List<String[]> tagList1 = new ArrayList<>();// 분리한 태그를 저장할 리스트
		List<String[]> tagList2 = new ArrayList<>();// 분리한 태그를 저장할 리스트
		List<String[]> tagList3 = new ArrayList<>();// 분리한 태그를 저장할 리스트


		for (ReviewVO tag1 : Tag1) {
		    addTagsToList(tagList1, tag1.getReview_SelectTag1(), tag1.getReview_Cafename());
		}

		for (ReviewVO tag2 : Tag2) {
		    addTagsToList(tagList2, tag2.getReview_SelectTag2(), tag2.getReview_Cafename());
		}

		for (ReviewVO tag3 : Tag3) {
		    addTagsToList(tagList3, tag3.getReview_SelectTag3(), tag3.getReview_Cafename());
		}
		
	
		for (ReviewVO review : List) {
		    StringBuilder sb1 = new StringBuilder();
		    addTagsToStringBuilder(tagList1, review, sb1);
		    review.setReview_SelectTag1(sb1.toString());
		}

		for (ReviewVO review : List) {
		    StringBuilder sb2 = new StringBuilder();
		    addTagsToStringBuilder(tagList2, review, sb2);
		    review.setReview_SelectTag2(sb2.toString());
		}

		for (ReviewVO review : List) {
		    StringBuilder sb3 = new StringBuilder();
		    addTagsToStringBuilder(tagList3, review, sb3);
		    review.setReview_SelectTag3(sb3.toString());
		}

		//System.out.println(List);
		
//		Map<String, List<String>> tagMap1 = createTagMap(tagList1);
//		Map<String, List<String>> tagMap2 = createTagMap(tagList2);
//		Map<String, List<String>> tagMap3 = createTagMap(tagList3);
//
//		System.out.println(tagMap1);
//		System.out.println(tagMap2);
//		System.out.println(tagMap3);
//		
//		model.addAttribute("tagMap1", tagMap1);
//		model.addAttribute("tagMap2", tagMap2);
//		model.addAttribute("tagMap3", tagMap3);
		
		
		
		model.addAttribute("List", List.subList(start, end));
		
	    model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("hasPrevPage", hasPrevPage);
		model.addAttribute("hasNextPage", hasNextPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);

		
	

	
		
		return "Main_page";
	}

	
	
	
	
	
	
	private void addTagsToList(List<String[]> tagList, String selectTag, String cafeName) {
	    if (selectTag != null) {
	        String[] tags = selectTag.split(",");
	        for (String tag : tags) {
	            String[] tagArray = {cafeName, tag.trim()};
	            tagList.add(tagArray);
	        }
	    }
	}
	
	private void addTagsToStringBuilder(List<String[]> tagList, ReviewVO review, StringBuilder sb) {
	    for (String[] tagArray : tagList) {
	        if (review.getReview_Cafename().equals(tagArray[0])) {
	            if (sb.length() > 0) {
	                sb.append(" ");
	            }
	            String tag = tagArray[1].trim();
	            if (!sb.toString().contains(tag)) {
	                sb.append(tag);
	            }
	        }
	    }
	}
	
	
	public Map<String, List<String>> createTagMap(List<String[]> tagList) {
	    Map<String, List<String>> tagMap = new HashMap<>();
	    for (String[] tag : tagList) {
	        String cafeName = tag[0];
	        String tagValue = tag[1];
	        if (!tagMap.containsKey(cafeName)) {
	            tagMap.put(cafeName, new ArrayList<>());
	        }
	        tagMap.get(cafeName).add(tagValue);
	    }
	    return tagMap;
	}
	
}


