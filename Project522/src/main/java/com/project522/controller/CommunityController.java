package com.project522.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project522.domain.CommunityVO;
import com.project522.domain.Criteria;
import com.project522.domain.PageDTO;
import com.project522.domain.ReplyDTO;
import com.project522.domain.ReplyVO;
import com.project522.mapper.CommunityMapper;
import com.project522.service.CommunityService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community")
@AllArgsConstructor

public class CommunityController {
	@Autowired
	private CommunityMapper mapper;
	private CommunityService service;

	@GetMapping("/list")
	public void getList(Criteria cri,Model model) {
		List<CommunityVO> test = mapper.getListWithPaging(cri);
		model.addAttribute("list", test);
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping({ "/modify" })
	public String modify(CommunityVO community, RedirectAttributes rttr) {
		service.modify(community);
		rttr.addFlashAttribute("result", community.getCommunity_num());
		return "redirect:/community/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("community_num") int community_num, Model model) {
		CommunityVO community = service.get(community_num);
		community.setUser_info(service.getUser(community));
		model.addAttribute("community", community);
		List<ReplyVO> replyList = mapper.getCommentList(community_num);
		List<ReplyDTO> replyDTOList = new ArrayList<ReplyDTO>();

		for (int i = 0; i < replyList.size(); i++) {
			if (replyList.get(i).getComment_ori_number() == 0) {
				ReplyDTO tempReplyDTO = new ReplyDTO(replyList.get(i), new ArrayList<ReplyVO>());
				replyDTOList.add(tempReplyDTO);
			}
		}
		for(int i = 0; i < replyList.size(); i++) {
			if(replyList.get(i).getComment_ori_number() != 0) {
				for(int j = 0; j < replyDTOList.size(); j++) {
					if(replyDTOList.get(j).getOri_Reply().getComment_num()==replyList.get(i).getComment_ori_number()){
						replyDTOList.get(j).getList().add(replyList.get(i));
					}
				}
			}
		}

		model.addAttribute("commentList", replyDTOList);
	}
	
	@GetMapping("/selectAddress")
	public String selectAddress() {
		return "community/selectAddress";
	}

	@RequestMapping("home")
	public String main() {
		return "home";
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(CommunityVO community, RedirectAttributes rttr) {
		service.register(community);
		rttr.addFlashAttribute("result", community.getCommunity_num());
		return "redirect:/community/list";
	}
	
	@PostMapping("/replyRegister")
	public String register(ReplyVO reply, RedirectAttributes rttr) {
		service.registerReply(reply);
		rttr.addFlashAttribute("result", reply.getCommunity_num());
		return "redirect:/community/get?community_num=" + reply.getCommunity_num();
	}
	
	@GetMapping({"/modifyReply" })
	public void modifyReply(@RequestParam("comment_num") int comment_num, Model model) {
		ReplyVO reply = service.getComment(comment_num);
		model.addAttribute("comment", reply);
	}
	
	@PostMapping({ "/modifyReply" })
	public String modifyReviw(ReplyVO reply, RedirectAttributes rttr) {
		service.modifyReply(reply);
		rttr.addFlashAttribute("result", reply.getComment_num());
		return "redirect:/community/get?community_num=" + reply.getCommunity_num();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("community_num") int community_num, RedirectAttributes rttr) {
		service.remove(community_num);
		return "redirect:/community/list";
	}
	
	@GetMapping("/removeReply")
	public String removeReply(@RequestParam("comment_num") int comment_num, RedirectAttributes rttr) {
		service.removeReply(comment_num);
		return "redirect:/community/list";
	}
	
}
