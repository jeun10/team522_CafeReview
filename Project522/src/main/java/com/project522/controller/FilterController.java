package com.project522.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project522.domain.ReviewVO;
import com.project522.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;



@Controller
@Log4j

public class FilterController{
	@Autowired
	private ReviewMapper mapper;

	
	@GetMapping("/Filter")
	public String Filter_Page(HttpServletRequest request,
	                          @RequestParam(defaultValue = "0") int page,
	                          @RequestParam(value = "SelectTag1", required = false) String[] SelectTag1, 
	                          @RequestParam(value = "SelectTag2", required = false) String[] SelectTag2,
	                          @RequestParam(value = "SelectTag3", required = false) String[] SelectTag3, 
	                          Model model) throws Exception {
		
		if (SelectTag1 == null && SelectTag2 == null && SelectTag3 == null) {
			  return "redirect:/";
		} else {
			


			
			System.out.println(Arrays.toString(SelectTag1));
			System.out.println(Arrays.toString(SelectTag2));
			System.out.println(Arrays.toString(SelectTag3));
			 // 체크 여부 확인 후, model에 체크 여부를 전달합니다.
			List<ReviewVO> List = mapper.getReviewList();
			//Filter?SelectTag1=공부

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
			
			
			Set<ReviewVO> filteredSet = new HashSet<>();
			for (ReviewVO review : List) {
			    if (SelectTag1 != null) {
			        for (String tag : SelectTag1) {
			            if (review.getReview_SelectTag1().contains(tag)) {
			                filteredSet.add(review);
			                break; // 중복 추가 방지
			            }
			        }
			    }
			    
			    if (SelectTag2 != null) {
			        for (String tag : SelectTag2) {
			            if (review.getReview_SelectTag2().contains(tag)) {
			                filteredSet.add(review);
			                break; // 중복 추가 방지
			            }
			        }
			    }
			    
			    if (SelectTag3 != null) {
			        for (String tag : SelectTag3) {
			            if (review.getReview_SelectTag3().contains(tag)) {
			                filteredSet.add(review);
			                break; // 중복 추가 방지
			            }
			        }
			    }
			}
			
			
			List<ReviewVO> filteredList = new ArrayList<>(filteredSet);

			   String queryString = request.getQueryString();
			    if (queryString != null) {
			        queryString = queryString.replaceAll("&?page=[^&]*", "");
			        if (queryString.endsWith("&")) {
			            queryString = queryString.substring(0, queryString.length() - 1);
			        }
			    }
			    String requestUrl = request.getRequestURL().toString() + (queryString == null ? "" : "?" + queryString);
			    
			    System.out.println("requestUrl : "+requestUrl);

			    model.addAttribute("requestUrl", requestUrl);
			
			    int currentPage = page;
			    int size = 8;
			    int start = currentPage * size;
			    int end = start + size;

			    System.out.println(filteredList.size());

			    if (end > filteredList.size()) {
			        end = start + (filteredList.size() % size);
			    }

			    // 이전/다음 페이지 링크 생성 코드
			    int totalPages = (int) Math.ceil((double) filteredList.size() / size);

			    int prevPage = currentPage - 1;
			    int nextPage = currentPage + 1;
			    boolean hasPrevPage = prevPage >= 0;
			    boolean hasNextPage = end < filteredList.size();
			
			
			model.addAttribute("SelectTag1",SelectTag1);
			model.addAttribute("SelectTag2",SelectTag2);
			model.addAttribute("SelectTag3",SelectTag3);
			
			model.addAttribute("List", filteredList.subList(start, end));
			
			 model.addAttribute("currentPage", currentPage);
			    model.addAttribute("totalPages", totalPages);
			    model.addAttribute("hasPrevPage", hasPrevPage);
			    model.addAttribute("hasNextPage", hasNextPage);
			    model.addAttribute("prevPage", prevPage);
			    model.addAttribute("nextPage", nextPage);
			

			return "Filter_page";
		}
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
}


