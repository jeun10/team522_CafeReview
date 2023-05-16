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
import com.project522.mapper.CommunityMapper;
import com.project522.mapper.MPCMapper;
import com.project522.mapper.ReviewMapper;
import com.project522.service.CommunityService;
import com.project522.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/MyPage/*") 
/* @RequestMapping("Project522/MyPage") */
@AllArgsConstructor
public class MPCController {
	@Autowired
	private MPCMapper mapper;
	private CommunityService service;
	private ReviewMapper reviewmapper;
	private ReviewService reviewService;
	private CommunityMapper communitymapper;

	@RequestMapping("/MyPage")
	public void MyPage() {
		log.info("MyPage");
	}

	@RequestMapping("/MyPageCommunity")
	public void MyPageCommunity() {
		log.info("MyPageCommunity");
	}

	/*
	 * @GetMapping("/Test") public String MPCTest(Model model) { List<MPCVO> MPCList
	 * = mapper.getMPC(); model.addAttribute("mpcList", MPCList); return
	 * "MyPage/Test"; }
	 */

	/*
	 * @GetMapping("/MPC") public String MPC(Model model) { List<MPCVO> MPCList =
	 * mapper.getMPC(); model.addAttribute("mpcList", MPCList); return "MyPage/MPC";
	 * }
	 */
	
	@PostMapping("/remove")
	public String remove(@RequestParam("community_num") int community_num, RedirectAttributes rttr) {
		service.remove(community_num);
		return "redirect:/MyPage/MPC";
	}
	
	/*review ��ü ��ȸ*/
	@GetMapping("/MPR")
	public String MPR(Model model) {
		List<ReviewVO> MPRList = reviewmapper.getAllReview();
		model.addAttribute("mprList", MPRList);
		return "MyPage/MPR";
	}
	
	@PostMapping("/removeMPR")
	public String removeMPR(@RequestParam("Rnum") int Rnum, RedirectAttributes rttr) {
	    reviewService.delReview(Rnum);
	    return "redirect:/MyPage/MPR";
	}

	@GetMapping("/MPC")
	public String getMPCList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */

		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		List<MPCVO> MPCList = mapper.getListWithPaging(cri); 
		model.addAttribute("mpcList", MPCList); 

		model.addAttribute("list", mapper.getListWithPaging(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.getTotalCount(cri)));

		return "MyPage/MPC";
	}
	
	@GetMapping("/MyPageReview")
	public String getMPRList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */
		
		/*Admin Controller로 이동*/
		if(user_id.equals("Admin")) { 
		    return "redirect:/Admin/AdminReview"; 
		}

		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		/*여기서부터 변경*/
		List<ReviewVO> MPRList = mapper.ReviewgetPage(cri); 
		model.addAttribute("mprList", MPRList); 

		model.addAttribute("list", mapper.ReviewgetPage(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.ReviewTotalCount(cri)));

		return "MyPage/MyPageReview";
	}
	
	/*리뷰 삭제 기능 MyPageReview remove*/
	@PostMapping("/removeMyPageReview")
	public String removeMyPageReview(@RequestParam("Review_Num") int Review_Num, RedirectAttributes rttr) {
		reviewmapper.deleteReview(Review_Num);
		return "redirect:MyPage/MyPageReview";
	}
	
	@GetMapping("/MyPageReply")
	public String getReplyList(HttpServletRequest request, Model model, MyPageCriteria cri) throws Exception {
		HttpSession session = request.getSession();
		
		
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		/* System.out.println("user_id" + user_id); */

		/* System.out.println(dtoList); */
		cri.setUser_id(user_id);
		/*여기서부터 변경*/
		List<ReplyVO> ReplyList = mapper.ReplygetPage(cri); 
		model.addAttribute("replyList", ReplyList); 

		model.addAttribute("list", mapper.ReplygetPage(cri)); 
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, mapper.ReplyTotalCount(cri)));
		return "MyPage/MyPageReply";
	}
	/*대댓글 삭제 기능 MyPageReply remove*/
	@PostMapping("/removeMyPageReply")
	public String removeMyPageReply(@RequestParam("comment_num") int comment_num, RedirectAttributes rttr) {
		communitymapper.removeReply(comment_num);
		return "redirect:MyPage/MyPageReply";
	}

}
