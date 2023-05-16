package com.project522.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project522.domain.CommunityVO;
import com.project522.domain.Criteria;
import com.project522.domain.ReplyVO;
import com.project522.domain.UserInfoVO;
import com.project522.mapper.CommunityMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	private CommunityMapper mapper;

	@Override
	public void register(CommunityVO community) {
		mapper.register(community);
	}

	@Override
	public void modify(CommunityVO community) {
		mapper.modify(community);
	}

	@Override
	public CommunityVO get(int community_num) {
		return mapper.get(community_num);
	}

	@Override
	public void remove(int community_num) {
		mapper.remove(community_num);
	}

	@Override
	public List<ReplyVO> getCommentList(int community_num) {
		return mapper.getCommentList(community_num);
	}

	@Override
	public void registerReply(ReplyVO reply) {
		mapper.registerReply(reply);
		
	}

	@Override
	public void modifyReply(ReplyVO reply) {
		mapper.modifyReply(reply);
	}

	@Override
	public ReplyVO getComment(int comment_num) {
		return mapper.getComment(comment_num);
	}

	@Override
	public void removeReply(int comment_num) {
		mapper.removeReply(comment_num);
		
	}

	@Override
	public List<CommunityVO> categoryList(String community_category) {
		return mapper.categoryList(community_category);
	}

	@Override
	public List<CommunityVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public UserInfoVO getUser(CommunityVO community) {
		return mapper.getUser(community);
	}

	@Override
	public UserInfoVO getUser(ReplyVO reply) {
		return mapper.getUser(reply);
	}

	@Override
	public List<CommunityVO> getList() {
		return mapper.getList();
	}
}
