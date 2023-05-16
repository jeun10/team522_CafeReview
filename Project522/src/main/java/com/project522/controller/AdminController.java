package com.project522.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project522.domain.MPCVO;
import com.project522.domain.MyPageCriteria;
import com.project522.domain.MyPagePageDTO;
import com.project522.domain.ReplyVO;
import com.project522.domain.ReviewVO;
import com.project522.domain.UserInfoVO;
import com.project522.mapper.AdminMapper;
import com.project522.mapper.CommunityMapper;
import com.project522.mapper.ReviewMapper;
import com.project522.service.CommunityService;
import com.project522.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Admin")
@AllArgsConstructor
public class AdminController {
	@Autowired
	private AdminMapper mapper;
	private ReviewMapper reviewmapper;
	private ReviewService reviewService;
	private CommunityMapper communitymapper;
	private CommunityService service;
	
	@GetMapping("/AdminReview")
	public String getMPRList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */
		
		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		/*여기서부터 변경*/
		List<ReviewVO> AdminMPRList = mapper.AdminReviewGet(cri); 
		model.addAttribute("AdminmprList", AdminMPRList); 

		model.addAttribute("list", mapper.AdminReviewGet(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.AdminReviewTotalCount(cri)));

		return "/Admin/AdminReview";
	}
	
	/*Admin 리뷰 삭제 기능 AdminReview remove*/
	@PostMapping("/removeAdminReview")
	public String removeMyPageReview(@RequestParam("Review_Num") int Review_Num, RedirectAttributes rttr) {
		reviewmapper.deleteReview(Review_Num);
		return "redirect:Admin/AdminReview";
	}
	
	@GetMapping("/AdminCommunity")
	public String getCommunityList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */
		
		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		/*여기서부터 변경*/
		List<MPCVO> AdminCommunityList = mapper.AdminCommunityGet(cri); 
		model.addAttribute("AdminCommunityList", AdminCommunityList); 

		model.addAttribute("list", mapper.AdminCommunityGet(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.AdminCommunityTotalCount(cri)));

		return "Admin/AdminCommunity";
	}
	
	/*Admin community 삭제 기능*/
	@PostMapping("/removeAdminCommunity")
	public String removeAdminCommunity(@RequestParam("community_num") int community_num, RedirectAttributes rttr) {
		service.remove(community_num);
		return "redirect:/Admin/AdminCommunity";
	}
	
	@GetMapping("/AdminReply")
	public String getReplyList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */
		
		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		/*여기서부터 변경*/
		List<ReplyVO> AdminReplyList = mapper.AdminReplyGet(cri); 
		model.addAttribute("AdminReplyList", AdminReplyList); 

		model.addAttribute("list", mapper.AdminReplyGet(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.AdminReplyTotalCount(cri)));

		return "Admin/AdminReply";
	}
	
	/*Admin 대댓글 삭제 기능 AdminReply remove*/
	@PostMapping("/removeAdminReply")
	public String removeAdminReply(@RequestParam("comment_num") int comment_num, RedirectAttributes rttr) {
		communitymapper.removeReply(comment_num);
		return "redirect:Admin/AdminReply";
	}
}
