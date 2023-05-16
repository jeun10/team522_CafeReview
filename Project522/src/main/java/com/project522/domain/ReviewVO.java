package com.project522.domain;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ReviewVO {
	private int review_Num;
	private int cafe_Num;
	private String review_SelectTag1;
	private String review_SelectTag2;
	private String review_SelectTag3;
	private String review_HashTag;
	private String review_Title;
	private String user_Id;
	private String review_Content;
	private Date review_Date;
	private String review_Image;
	private String review_Cafename;
	private String review_Cafeaddr;
	
	private String user_nickname;
	
	private String fileName;
	private List<MultipartFile> review_Image1;
	private String delImg;
	


	
	
}
