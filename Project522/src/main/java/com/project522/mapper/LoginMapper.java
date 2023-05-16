
 package com.project522.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project522.domain.UserInfoVO;
import com.project522.domain.UserVO;


public interface LoginMapper {
	
	  public List<UserVO> getUserInfo();
	  
	  
	  public List<UserVO> checkUserIdExist (String user_id);
	  
	  
	  public List<UserVO> checkUserNicKNameExist (String user_nickname);

	  
	  public  UserInfoVO getUserInfoList(@Param("user_id") String user_id, @Param("user_pw") String user_pw);

	 public void insertUser(UserInfoVO UserInfoVO);

  }
 