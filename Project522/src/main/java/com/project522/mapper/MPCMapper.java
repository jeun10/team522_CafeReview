package com.project522.mapper;

import java.util.List;

import com.project522.domain.MPCVO;
import com.project522.domain.MyPageCriteria;
import com.project522.domain.ReplyVO;
import com.project522.domain.ReviewVO;

public interface MPCMapper {
	
	/* public List<MPCVO> getMPC(); */
	
	/* public List<MPCVO> getMPCList(String user_id); */ //session
	
	/*페이징*/
	public List<MPCVO> getListWithPaging(MyPageCriteria cri);
	public int getTotalCount(MyPageCriteria cri);
	
	public List<MPCVO> getMPCList(MyPageCriteria cri);
	
	/*review*/
	public List<ReviewVO> ReviewgetPage(MyPageCriteria cri);
	public int ReviewTotalCount(MyPageCriteria cri);
	
	/*reply*/
	public List<ReplyVO> ReplygetPage(MyPageCriteria cri);
	public int ReplyTotalCount(MyPageCriteria cri);

}
