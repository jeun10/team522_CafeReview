package com.project522.mapper;

import java.util.List;

import com.project522.domain.MPCVO;
import com.project522.domain.MyPageCriteria;
import com.project522.domain.ReplyVO;
import com.project522.domain.ReviewVO;

public interface AdminMapper {
	
	/*Adminreview*/
	public List<ReviewVO> AdminReviewGet(MyPageCriteria cri);
	public int AdminReviewTotalCount(MyPageCriteria cri);
	
	/*AdminCommunity*/
	public List<MPCVO> AdminCommunityGet(MyPageCriteria cri);
	public int AdminCommunityTotalCount(MyPageCriteria cri);
	
	/*AdminReply*/
	public List<ReplyVO> AdminReplyGet(MyPageCriteria cri);
	public int AdminReplyTotalCount(MyPageCriteria cri);
	
}
