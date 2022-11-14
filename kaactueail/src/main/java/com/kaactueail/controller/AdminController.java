package com.kaactueail.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kaactueail.dao.AdminDAO;
import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.CockitDTO;
import com.kaactueail.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static String newfilename = "";
	
	@Autowired
	AdminDAO dao;
	
	@GetMapping("/usermanagement")
	public String SelectAllUser(String option,String mId, Model model, HttpSession session) {
		List<MemberDTO> list;
		if(session.getAttribute("mRole").equals("ROLE_ADMIN")) {
		if(mId == "" || mId == null) {
			list = dao.SelectAllUser();
		}
		else {
			if(option.equals("mName")) list = dao.selectnamemember(mId);
			
			else  list = dao.selectmember(mId);
		}
		
		int personcount = dao.CountAllUser();
		
		model.addAttribute("list", list);
		
		model.addAttribute("personcount", personcount);
		return "admin/usermanagement";
		}
		else
			return "error";
	}
	
	@GetMapping("/deletemember")
	@PostMapping("/deleteMember")
	public @ResponseBody void deleteMember(String mNum, HttpServletResponse response, HttpSession session) throws IOException {
		if(session.getAttribute("mRole").equals("ROLE_ADMIN")) {
		dao.deleteMember(mNum);
		response.sendRedirect("/admin/usermanagement");
		}
		else
			response.sendRedirect("error");
	}
	
	
	@GetMapping("/cockit")
	public String SelectAllCockitStock(Model model, String cName) {
		
		List<CockitDTO> list;
		if(cName == "" || cName == null) {
			list = dao.SelectAllCockitStock();
		}
		else 
			list = dao.selectcockit(cName);
		model.addAttribute("cockit", list);
		
		return "admin/cockitstock";
	}
	
	
	@GetMapping("/deleteproduct")
	@PostMapping("/deleteproduct")
	public @ResponseBody void deleteProduct(String cNum, HttpServletResponse response, HttpSession session) throws IOException {
	
		dao.deleteProduct(cNum);
		response.sendRedirect("/admin/cockit");
	}

	
	@GetMapping("/updateproduct")
	@PostMapping("/updateproduct")
	public @ResponseBody void updateProduct(String cNum,String cName, String cAmount, String cPrice, HttpServletRequest request,HttpServletResponse response, CockitDTO dto) throws IOException {
		
		dto.setcName(cName);
		dto.setcPrice(Integer.parseInt(cPrice));
		dto.setcAmount(Integer.parseInt(cAmount));
		dto.setcNum(Integer.parseInt(cNum));
		
		dao.updateProduct(dto);
		response.sendRedirect("/admin/cockit");
	}
	//-----------------------------------------------------------------------------------------------------//

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
	      String uploadFolder = "C:/Users/KOSA/git/repository777/kaactueail/src/main/webapp/resources/images/cockit";
	     
	      String filename = fileRealName.substring(0,fileRealName.lastIndexOf("."));
	      newfilename = filename;
	      System.out.println(filename);
	      File saveFile = new File(uploadFolder+"\\"+fileRealName); // uuid 적용 전
	      
//	      File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
	      try {
	         file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return "admin/upload";
	   }
	   
	   
	   // 칵테일 정보 등록 페이지 접속
	   @GetMapping("/write")
	   public void writeGet(Model model) {     
	      System.out.println("새 파일 이름은 " + newfilename.length());
	      if(newfilename.length() > 0) {
	         model.addAttribute("filename", newfilename);
	      }
	      System.out.println("getWrite");
	   }
	   // 칵테일 정보 등록(관리자만 접근가능)
	   @PostMapping("/write")
	   public String writePost(HttpServletRequest request, CockitDTO dto, RedirectAttributes rttr, Model model) {
	      newfilename = "";
	      String cName = request.getParameter("cName");
	      int result = dao.selectcName(cName);
	      if(result == 1) {   
	         model.addAttribute("message", "<font size = \"3\" color =\"red\">중복된 칵테일 이름입니다.</font>");
	         return "write";
	      }
	      System.out.println("1");
	 
	      dao.writeCockit(dto);
	      System.out.println("2");
	  
	      rttr.addFlashAttribute("result", "write success");
	      System.out.println("postWrite");
	      return "redirect:/admin/usermanagement";
	   }
}
