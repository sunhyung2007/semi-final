package com.kaactueail.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kaactueail.dao.CockInfoBoardDAO;
import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.PageMakerDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/infoboard/*")
public class infoboardController {
	private static String newfilename = "";
	private static final Logger log = LoggerFactory.getLogger(infoboardController.class);
	@Autowired
	private CockInfoBoardDAO dao;

	@GetMapping("/list")
	public void list(Model model, Criteria cri) {

		log.info("CockInfoboard List 페이지 진입");
		
		log.info("cri : " + cri);
		
		model.addAttribute("list", dao.selectAll(cri));
		System.out.println(model);

		int total = dao.getTotal();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

	}

	// 업로드로 가는 메소드
	@GetMapping("/uploadSuccess")
	public void form() {}
	
	@PostMapping("/upload")
	public String upload(@RequestParam("file") MultipartFile file) {
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈	
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\test\\upload";
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타언어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜덤 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		String filename = fileRealName.substring(0,fileRealName.lastIndexOf("."));
		newfilename = filename;
		System.out.println(filename);
		File saveFile = new File(uploadFolder+"\\"+fileRealName); // uuid 적용 전
		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/infoboard/upload";
	}
	
	
	// 칵테일 정보 등록 페이지 접속
	@GetMapping("/write")
	public void writeGet(Model model) {
		log.info("정보 등록 페이지 진입");		
		System.out.println("새 파일 이름은 " + newfilename.length());
		if(newfilename.length() > 0) {
			model.addAttribute("filename", newfilename);
		}
		System.out.println("getWrite");
	}
	// 칵테일 정보 등록(관리자만 접근가능)
	@PostMapping("/write")
	public String writePost(HttpServletRequest request, CockInfoBoardDTO board, RedirectAttributes rttr, Model model) {
		newfilename = "";
		String infoTitle = request.getParameter("infoboardTitle");
		int result = dao.selectTitle(infoTitle);
		if(result == 1) {	
			model.addAttribute("message", "<font size = \"3\" color =\"red\">중복된 칵테일 이름입니다.</font>");
			return "/infoboard/write";
		}
		System.out.println("1");
		log.info("BoardDTO : " + board);
		dao.write(board);
		System.out.println("2");
		log.info("BoardDTO : " + board);
		rttr.addFlashAttribute("result", "write success");
		System.out.println("postWrite");
		return "redirect:/infoboard/list";
	}
	
	// 칵테일 정보 상세 조회
	@GetMapping("get")
	public void getDetail(int infoboardNum, Model model, Criteria cri) throws Exception {
		log.info("/get");
		dao.updateReadcount(infoboardNum);
		model.addAttribute("pageInfo", dao.getDetail(infoboardNum));
		
		model.addAttribute("cri", cri);
		System.out.println(infoboardNum);
	}
	
	
	// 수정 페이지로 이동하며 상세 페이지처럼 데이터 가지고 옴
	@GetMapping("modify")
	public void Getmodify(int infoboardNum, Model model) {
		System.out.println(infoboardNum);
		model.addAttribute("pagemodify", dao.getDetail(infoboardNum));
		System.out.println(dao.getDetail(infoboardNum));
	}
	
	
	// post방식(글 수정 후 수정버튼 클릭)으로 오면
	@PostMapping("modify")
	public String Postmodify(CockInfoBoardDTO dto) {
		System.out.println("모디파이 수정까지");
		dao.modify(dto);
		return "redirect:/infoboard/list";
	}
	
	// 삭제버튼 클릭시
	@PostMapping("delete")
	public String Postdelete(int infoboardNum) {
		dao.remove(infoboardNum);
		System.out.println(infoboardNum);
		return "redirect:/infoboard/list";
	}
}
