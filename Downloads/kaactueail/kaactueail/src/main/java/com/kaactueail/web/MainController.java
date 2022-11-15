package com.kaactueail.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.CockInfoBoardDAO;
import com.kaactueail.dao.MyCocktailBoardDAO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	   @Autowired
	   private CockInfoBoardDAO infoDao;
	   
	   @Autowired
	   private MyCocktailBoardDAO mycockDao;

	   @RequestMapping("/")
	   public String list(Model model) {
	      System.out.println(infoDao.mainSelect());
	      model.addAttribute("cockInfoList", infoDao.mainSelect());
	      model.addAttribute("myCockList", mycockDao.mainSelect());
	      System.out.println(model);
	      return "main";

	   }
}
