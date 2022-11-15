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

	// �긽�꽭�럹�씠吏� 議고쉶
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

	// 醫뗭븘�슂 異붽�
	@RequestMapping(value = "/makeolike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeolike(LikeDTO dto) throws Exception {
		dao.makeolike(dto);

	}

	// 醫뗭븘�슂 痍⑥냼
	@RequestMapping(value = "/makeunlike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeunlike(LikeDTO dto) throws Exception {
		dao.makeunlike(dto);
	}

	// �뾽濡쒕뱶濡� 媛��뒗 硫붿냼�뱶
	@GetMapping("/uploadSuccess")
	public void form() {
	}

	@PostMapping("/upload")
	public String upload(@RequestParam("file") MultipartFile file, Model model) {
		String fileRealName = file.getOriginalFilename(); // �뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = file.getSize(); // �뙆�씪 �궗�씠利�

		// �꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽 �솗�옣�옄 紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = "C:/Users/KOSA/Desktop/kaactueail_1114_ver2222/kaactueail/src/main/webapp/resources/images/mycocktailImagefolder";

		/*
		 * �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎.
		 * ���뼵�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�궛 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆) 怨좎쑀�븳 �옖�뜡 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷
		 * �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
		 */

		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];

		String filename = fileRealName.substring(0, fileRealName.lastIndexOf("."));
		newfilename = filename;
		realfileName = fileRealName;
		File saveFile = new File(uploadFolder + "\\" + fileRealName); // uuid �쟻�슜 �쟾

		model.addAttribute("realname", fileRealName);
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
		try {
			file.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/mycocktailboard/upload";
	}

	// 移듯뀒�씪 �젙蹂� �벑濡� �럹�씠吏� �젒�냽
	@GetMapping("/write")
	public void writeGet(Model model) {
		
		if (newfilename.length() > 0) {
			model.addAttribute("filename", newfilename);
		}
	}

	// �굹留뚯쓽 移듯뀒�씪 �젙蹂� �벑濡�
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

	// 寃뚯떆湲� �닔�젙
	// �닔�젙 �럹�씠吏�濡� �씠�룞�븯硫� �긽�꽭 �럹�씠吏�泥섎읆 �뜲�씠�꽣 媛�吏�怨� �샂
	@GetMapping("modify")
	public void Getmodify(int mycocktailNum, Model model) {
		model.addAttribute("pagemodify", dao.getBymycocktailNum(mycocktailNum));
	}

	// �닔�젙�럹�씠吏��뿉�꽌 �뜲�씠�꽣 蹂대궡�꽌 �닔�젙
	@PostMapping("modify")      
	public String Postmodify(MyCocktailBoardDTO dto) {
		dao.modifyMycocktailboard(dto);
		return "redirect:/mycocktailboard/list";
	}
	
	// �궘�젣踰꾪듉 �겢由��떆
		@PostMapping("delete")
		public String Postdelete(int mycocktailNum) {
			dao.removeMycocktailboard(mycocktailNum);
			
			System.out.println(mycocktailNum);
			return "redirect:/mycocktailboard/list";
		}
}