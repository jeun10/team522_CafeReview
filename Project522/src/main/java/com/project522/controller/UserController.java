package com.project522.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project522.domain.ReviewVO;
import com.project522.domain.UserInfoVO;
import com.project522.domain.UserVO;
import com.project522.example.IdExistNotCheckMatchedException;
import com.project522.example.NotFindMatchedException;
import com.project522.example.PasswordNotMatchedException;
import com.project522.mapper.LoginMapper;

import org.springframework.validation.BindingResult;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j

@RequestMapping("/user_login/*")

public class UserController {
	
	@Autowired 
	private LoginMapper mapper;
	
	@Autowired 
	private SqlSessionFactory sqlSessionFactory;

	
	@GetMapping("/login")
	public String login() {
		
		return "user_login/login";
	}
	
	
	@PostMapping("/login_pro")
	public String login_pro(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, HttpSession session, Model model) {
	    // 로그인 처리 로직
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	    LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
	    UserInfoVO userInfo = loginMapper.getUserInfoList(user_id, user_pw);

	    System.out.println(userInfo);

	    if (userInfo != null) {
	        // 로그인 성공
	        System.out.println("로그인 성공");
	        session.setAttribute("userInfo", userInfo);
	        
	        sqlSession.close(); // SqlSession을 사용한 후 반드시 close() 메소드를 호출하여 자원을 반납합니다.
	        return "user_login/login_success";
	    } else {
	        // 로그인 실패
	        System.out.println("로그인 실패");
	        model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");

	        sqlSession.close(); // SqlSession을 사용한 후 반드시 close() 메소드를 호출하여 자원을 반납합니다.
	        return "user_login/login"; // 로그인 실패시 JSP 파일을 반환하도록 수정
	    }
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    return "redirect:/";
	}


	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserVO") UserVO joinUserVO) {
		return "user_login/join";
	}
	
	
	@PostMapping("/join_pro")
	public String join_pro(@Valid UserVO joinUserVO,BindingResult result ,Model model) {	  
		
		
		try {
		    joinUserVO.validateEquals();
		    List<UserVO> ckid = mapper.checkUserIdExist(joinUserVO.getUser_id());
			List<UserVO> ckn = mapper.checkUserNicKNameExist(joinUserVO.getUser_nickname());
		    
			 if(!ckid.isEmpty()){
					model.addAttribute("errorID", "존재하는 아이디 입니다.");
					 return "user_login/join";
			}
			 
			 if (!ckn.isEmpty()){
				 model.addAttribute("errorNick", "존재하는 닉네임 입니다.");
				 return "user_login/join";
			 }
		    

		} catch (PasswordNotMatchedException ex) {// 비밀번호 일치 판단
		    result.rejectValue("user_pw2", "error.joinUserVO", ex.getMessage()); // 유효성 검사 에러 추가
		    if (result.hasErrors()) {
		        // 유효성 검사 실패 시 처리할 로직
		    	model.addAttribute("errorPW", "비밀번호가 일치하지 않습니다.");
		        return "user_login/join"; // 유효성 검사 실패 시 다시 회원가입 페이지로 이동
		    }
		}
		
		
		
		
	
	    UserInfoVO userinfo = new UserInfoVO();
	    
	    userinfo.setUser_name(joinUserVO.getUser_name());
	    userinfo.setUser_id(joinUserVO.getUser_id());
	    userinfo.setUser_pw(joinUserVO.getUser_pw());
	    userinfo.setUser_nickname(joinUserVO.getUser_nickname());
	    userinfo.setUser_address("이태원");
	    
	    System.out.println(userinfo);
	    
	    mapper.insertUser(userinfo);
	   
	    model.addAttribute(userinfo);
	    return "user_login/join_success";
		
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "user_login/modify";
	}

}


