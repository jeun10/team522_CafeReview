package com.project522.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project522.domain.ReviewCriteria;
import com.project522.domain.ReviewVO;
import com.project522.domain.TagVO;
import com.project522.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {

	private ReviewService service;

	// 리뷰 리스트 화면
	@GetMapping("/listReview")
	public String listReview() {
		return "review/listReview";
	}

	// 리뷰 작성 페이지 화면

	@GetMapping("/insertReview")
	public String insertReview(TagVO tagvo, Model model) throws Exception {
		log.info("리뷰 작성페이지 진입");
		model.addAttribute("getTagList1", service.getReviewTagList1(tagvo));
		model.addAttribute("getTagList2", service.getReviewTagList2(tagvo));
		model.addAttribute("getTagList3", service.getReviewTagList3(tagvo));
//		model.addAttribute("getTagList4", service.getReviewTagList4(tagvo));
		return "review/insertReview";

	}

	
	@PostMapping("/reviewinsert")
	public String insertReview(ReviewVO reviewvo, RedirectAttributes rttr) throws Exception {

		String path = "C:\\upload\\temp\\";
		// String projectPath = System.getProperty("user.dir") +
		// "\\src\\main\\resources\\static\\files";

		String fileName = "";

		List<MultipartFile> uploadFile = reviewvo.getReview_Image1();

		log.info("--------------------");

		for (MultipartFile mf : uploadFile) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize == 0) {// 사진 파일이 들어온게 없을때 -> 파일 사이즈 0
				break;
			}

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String ext = FilenameUtils.getExtension(originFileName);
			UUID uuid = UUID.randomUUID();
			String uuid_filename = uuid + "." + ext;
			String safeFile = path + uuid_filename;
			log.info(safeFile);
			log.info("--------------------");
			try {
				mf.transferTo(new File(safeFile));
				fileName = fileName + "," + uuid_filename;
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		//해시태그 값 설정
		String str = reviewvo.getReview_HashTag();
		if( str!= null) {
			str = str.replaceAll("NULL,","");
			str = str.replaceAll("NULL","");

			
		}

		// log.info("파일 이름:" + fileName);

		reviewvo.setReview_Image(fileName);
		log.info(reviewvo.getUser_Id());

		
		log.info("str : " + str);

		reviewvo.setReview_HashTag(str);

		log.info("ReviewVO : " + reviewvo);

		service.register(reviewvo);

		return "redirect:/review/getReview?review_Num=" + reviewvo.getReview_Num();
	}

	@GetMapping("/getReview")
	public void getReview(@RequestParam("review_Num") int review_Num,@ModelAttribute("cri") ReviewCriteria cri, ReviewVO reviewvo, Model model) throws Exception {
		log.info("리뷰 상세 조회 페이지 진입");
		String nickname=service.getReviewNickname(review_Num);
		log.info("리뷰넘버"+nickname);
		reviewvo=service.getReview(review_Num);
		reviewvo.setUser_nickname(nickname);

		log.info(reviewvo);

		model.addAttribute("review", reviewvo);
		//reviewvo = service.getReview(review_Num);
		log.info(reviewvo);
		if (reviewvo.getReview_Image() != null) {
			String str = reviewvo.getReview_Image();
			
			String[] str2 = str.substring(1).split(",");

			for (int i = 0; i < str2.length; i++) {
				System.out.println(str2[i]);
			}

			model.addAttribute("imgarray", str2);

		}
		
		String reviewtag1 = reviewvo.getReview_SelectTag1();
		reviewtag1 = reviewtag1.replace(",", " ");
		reviewvo.setReview_SelectTag1(reviewtag1);
		
		String reviewtag2 = reviewvo.getReview_SelectTag2();
		reviewtag2 = reviewtag2.replace(",", " ");
		reviewvo.setReview_SelectTag2(reviewtag2);
		
		String reviewtag3 = reviewvo.getReview_SelectTag3();
		reviewtag3 = reviewtag3.replace(",", " ");
		reviewvo.setReview_SelectTag3(reviewtag3);
		
		if (reviewvo.getReview_HashTag() != null) {
			String str = reviewvo.getReview_HashTag();
			
			String[] str2 = str.split(",");
			
			
			for (int i = 0; i < str2.length; i++) {
				System.out.println(i+":"+ str2[i]);
			}

			model.addAttribute("hashtagarray", str2);

		}
	}

	@GetMapping("/modifyReview")
	public void modifyReview(@RequestParam("review_Num") int review_Num,@ModelAttribute("cri") ReviewCriteria cri ,ReviewVO reviewvo, TagVO tagvo, Model model)
			throws Exception {
		log.info("수정 페이지 진입");
		model.addAttribute("review", service.getReview(review_Num));
		model.addAttribute("getTagList1", service.getReviewTagList1(tagvo));
		model.addAttribute("getTagList2", service.getReviewTagList2(tagvo));
		model.addAttribute("getTagList3", service.getReviewTagList3(tagvo));
//		model.addAttribute("getTagList4", service.getReviewTagList4(tagvo));

		reviewvo = service.getReview(review_Num);

		log.info(reviewvo);
		
		if (reviewvo.getReview_Image() != null) {
			String str = reviewvo.getReview_Image();
			String[] str2 = str.substring(1).split(",");

			for (int i = 0; i < str2.length; i++) {
				System.out.println(str2[i]);
			}

			model.addAttribute("imgarray", str2);

		}
		if (reviewvo.getReview_HashTag() != null) {
			String str = reviewvo.getReview_HashTag();
			str= str.replaceAll("\\s", "");
			model.addAttribute("hashtagarray", str);
		}
		
		

	}

	@PostMapping("/reviewmodify")
	public String reviewmodify(@ModelAttribute("cri") ReviewCriteria cri ,ReviewVO reviewvo, RedirectAttributes rttr) {
		log.info("수정 버튼 클릭");
		
		String path = "C:\\upload\\temp\\";
		int imgflag=0; //0일때 이미지 수정 x, 1일때 이미지 수정o
		String fileName = "";
		
		//삭제 이미지 처리
		String removeimglist = reviewvo.getDelImg();
		String oldimglist = reviewvo.getReview_Image();
		log.info( removeimglist.length());
		if(removeimglist.length()!=0) {
			imgflag=1;
			
			log.info("removeimglist : " + removeimglist);
			log.info("oldimglist : " + oldimglist);
			
			String[] str2 = removeimglist.split(",");

			for (int i = 0; i < str2.length; i++) {
				log.info("str2 : " + str2[i]);
				String dstr=","+str2[i];
				oldimglist = oldimglist.replaceAll(dstr,"");
				log.info("oldimglist : " + oldimglist);
				try {
					String fpath = path+str2[i]; // C 드라이브 -> test폴더 -> test.txt
					File file = new File(fpath); // file 생성

					if (file.delete()) { // f.delete 파일 삭제에 성공하면 true, 실패하면 false
						log.info("파일을 삭제하였습니다");
						
					} else {
						log.info("파일 삭제에 실패하였습니다");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}//end for
		}
		
		//추가한 이미지 처리
		List<MultipartFile> uploadFile = reviewvo.getReview_Image1();

		log.info("--------------------");

		for (MultipartFile mf : uploadFile) {
			
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize == 0) {// 사진 파일이 들어온게 없을때 -> 파일 사이즈 0
				log.info("새로 들어온 파일 없음");

				break;
			}
			log.info("새로 들어온 파일 있음");

			imgflag = 1;

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String ext = FilenameUtils.getExtension(originFileName);
			UUID uuid = UUID.randomUUID();
			String uuid_filename = uuid + "." + ext;
			String safeFile = path + uuid_filename;
			log.info(safeFile);
			log.info("--------------------");
			try {
				mf.transferTo(new File(safeFile));
				fileName = fileName + "," + uuid_filename;
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		String newimglist=oldimglist+fileName;
		reviewvo.setReview_Image(newimglist);
		
		log.info("수정된 newimglist : " + newimglist);
		log.info("이미지 수정여부 확인:" + imgflag);

		String str = reviewvo.getReview_HashTag();
		log.info("수정전 str : " + str);
		if( str!= null) {
			str = str.replaceAll("NULL,","");
			str = str.replaceAll("NULL","");	
			log.info("수정 후 str : " + str);
		}
		
		reviewvo.setReview_HashTag(str);
		
		log.info("ReviewVO : " + reviewvo);
		if(imgflag==1) {
			service.modiReviewImg(reviewvo);
		}
		else if(imgflag==0) {
			service.modiReview(reviewvo);
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/getReview?review_Num=" + reviewvo.getReview_Num();

	}

	@PostMapping("/reviewdelete")
	public String reviewdelete(@RequestParam("review_Num") int review_Num, RedirectAttributes rttr) {
		log.info("리뷰 삭제 실행");
		int result = service.delReview(review_Num);
		if (result == 1) {
			log.info("리뷰 삭제 완료" + review_Num);

		}
		return "redirect:/";

	}

}
