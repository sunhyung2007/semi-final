package com.kaactueail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.BucketDAO;
import com.kaactueail.dto.BucketDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Controller
@RequestMapping("/bucketlist")
public class bucketlistController {
	
	@Autowired
	private BucketDAO dao;
	
	@GetMapping("list")
	public void Getlist(BucketDTO dto, Model model, HttpSession session) {
		String mId = (String)session.getAttribute("mId"); 
		int mNum = (Integer)session.getAttribute("mNum");
		
		
		model.addAttribute("list", dao.getBucketList(mNum));
		System.out.println(mNum);
		System.out.println(mId);
		
	}
	
	@PostMapping("update")
	public String PostupdateAmount(BucketDTO bucket) {
		dao.modifyCount(bucket);
		return "redirect:/bucketlist/list";
	}
	
	@PostMapping("delete")
	public String Postdeletebucket(int bucketlistNum) {
		dao.deleteBucket(bucketlistNum);
		return "redirect:/bucketlist/list";
	}
}
