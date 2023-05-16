package com.project522.service;

import java.util.List;


import com.project522.domain.CommunityVO;
import com.project522.domain.Criteria;
import com.project522.domain.ReplyVO;
import com.project522.domain.UserInfoVO;

public interface CommunityService {
	public void register(CommunityVO community);
	public CommunityVO get(int community_num);
	public void modify(CommunityVO community);
	public void remove(int community_num);
	public List<ReplyVO> getCommentList(int community_num);
	public ReplyVO getComment(int comment_num);
	public void registerReply(ReplyVO reply);
	public void modifyReply(ReplyVO reply);
	public void removeReply(int comment_num);
	public List<CommunityVO> categoryList(String community_category);
	public List<CommunityVO> getList(Criteria cri);
	public List<CommunityVO> getList();
    public int getTotal(Criteria cri);
    public UserInfoVO getUser(CommunityVO community);
    public UserInfoVO getUser(ReplyVO reply);
}
