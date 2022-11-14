package com.kaactueail.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kaactueail.dao.MyCocktailBoardDAO;
import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.LikeDTO;
import com.kaactueail.dto.MyCocktailBoardDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mycocktailboard")
public class MycocktailboardController {
	private static String newfilename = "";
	private static String realfileName = "";
	
	@Autowired
	private MyCocktailBoardDAO dao;

	@GetMapping("list")
	public void Getlist(Model model, HttpServletRequest request, HttpSession session) {
		dao.updatelikenum();
		model.addAttribute("mycocktailboardlist", dao.getAllMycocktailboardList());
		String url = request.getRequestURL().toString();
		session.setAttribute("url", url);
	}

	// 상세페이지 조회
	@GetMapping("detail")
	public void Getdetail(int mycocktailNum, Model model, HttpSession session, HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		session.setAttribute("url", url);
		model.addAttribute("pageDetail", dao.getBymycocktailNum(mycocktailNum));
		LikeDTO like = new LikeDTO();
		like.setLikeboardMyCocktailNum(mycocktailNum);
		
		if (session.getAttribute("mNum") == (null))
			like.setLikeboardMemberNum(0);
		else
			like.setLikeboardMemberNum((Integer) session.getAttribute("mNum"));
		model.addAttribute("like", dao.findLike(like));
		model.addAttribute("member", like.getLikeboardMemberNum());
	}

	// 좋아요 추가
	@RequestMapping(value = "/makeolike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeolike(LikeDTO dto) throws Exception {
		dao.makeolike(dto);

	}

	// 좋아요 취소
	@RequestMapping(value = "/makeunlike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeunlike(LikeDTO dto) throws Exception {
		dao.makeunlike(dto);
	}

	// 업로드로 가는 메소드
	@GetMapping("/uploadSuccess")
	public void form() {
	}

	@PostMapping("/upload")
	public String upload(@RequestParam("file") MultipartFile file, Model model) {
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = "C:/Users/kOSA/git/semi-final/kaactueail/src/main/webapp/resources/images/mycocktailImagefolder";

		/*
		 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
		 * 타언어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜덤 문자를 통해 db와 서버에 저장할
		 * 파일명을 새롭게 만들어 준다.
		 */

		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];

		String filename = fileRealName.substring(0, fileRealName.lastIndexOf("."));
		newfilename = filename;
		realfileName = fileRealName;
		File saveFile = new File(uploadFolder + "\\" + fileRealName); // uuid 적용 전

		model.addAttribute("realname", fileRealName);
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/mycocktailboard/upload";
	}

	// 칵테일 정보 등록 페이지 접속
	@GetMapping("/write")
	public void writeGet(Model model) {
		
		if (newfilename.length() > 0) {
			model.addAttribute("filename", newfilename);
		}
	}

	// 나만의 칵테일 정보 등록
	@PostMapping("/write")
	public String writePost(HttpServletRequest request, MyCocktailBoardDTO dto, RedirectAttributes rttr, Model model,
			HttpSession session) {
		String infoTitle = request.getParameter("mycocktailImgName");
		log.info("BoardDTO : " + dto);
		dto.setMycocktailMemberNum((Integer) session.getAttribute("mNum"));
		dto.setMycocktailWriter((String)session.getAttribute("mId"));
		dto.setMycocktailImgName(realfileName);
		dao.write(dto);
		log.info("BoardDTO : " + dto);
		rttr.addFlashAttribute("result", "write success");
		return "redirect:/mycocktailboard/list";
	}

	// 게시글 수정
	// 수정 페이지로 이동하며 상세 페이지처럼 데이터 가지고 옴
	@GetMapping("modify")
	public void Getmodify(int mycocktailNum, Model model) {
		model.addAttribute("pagemodify", dao.getBymycocktailNum(mycocktailNum));
	}

	// 수정페이지에서 데이터 보내서 수정
	@PostMapping("modify")      
	public String Postmodify(MyCocktailBoardDTO dto) {
		dao.modifyMycocktailboard(dto);
		return "redirect:/mycocktailboard/list";
	}
	
	// 삭제버튼 클릭시
		@PostMapping("delete")
		public String Postdelete(int mycocktailNum) {
			dao.removeMycocktailboard(mycocktailNum);
			
			System.out.println(mycocktailNum);
			return "redirect:/mycocktailboard/list";
		}
}