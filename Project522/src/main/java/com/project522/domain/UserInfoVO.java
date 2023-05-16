package com.project522.domain;
import com.project522.example.NotFindMatchedException;
import com.project522.example.PasswordNotMatchedException;

import lombok.Data;
@Data
public class UserInfoVO {
	
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_nickname;
	private String user_address; // 이태원 고정값
	
	

	
}
