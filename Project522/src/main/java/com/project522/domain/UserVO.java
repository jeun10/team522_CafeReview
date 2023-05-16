package com.project522.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.project522.example.IdExistNotCheckMatchedException;
import com.project522.example.PasswordNotMatchedException;

import lombok.Data;


@Data
public class UserVO {
	private String user_name;
	
	private String user_id;

	private String user_pw;
	
	private String user_pw2;
	
	private String user_nickname;
	private String user_address; // 이태원 고정값
	
	private boolean userIdExist;



	
	public void validateEquals() {
	    if (!user_pw.equals(user_pw2)) {
	        throw new PasswordNotMatchedException("비밀번호가 일치하지 않습니다.");
	    }
	}

	
	
}
