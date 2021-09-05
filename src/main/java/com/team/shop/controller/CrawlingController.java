package com.team.shop.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.service.CrawlingService;

@Controller
@RequestMapping("/crawl/*")
public class CrawlingController {
	
	private final CrawlingService service;
	
	@Inject
	public CrawlingController(CrawlingService service) {
		this.service = service;
	}

	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String get_categories(Model model) throws Exception {
		
		ArrayList<String> al1 = new ArrayList<>();
		ArrayList<String> al2 = new ArrayList<>();
		
		String category = "https://smartstore.naver.com/setinshop/category/dee12a9ae652482883678bc6f0d36935?cp=1";
		Connection conn = Jsoup.connect(category);
		Document doc = conn.get();
		
		Elements elem = doc.getElementsByClass("_25CKxIKjAk");
		for (Element element : elem) {
			String img = element.attr("abs:src");
			al1.add(img);			
		}
		
		Elements elem2 = doc.select(".QNNliuiAk3");
		for (int j = 0; j < elem2.size(); j++) {
            final String title = elem2.get(j).text();;			
            al2.add(title);
        }
		
		model.addAttribute("img", al1);
		model.addAttribute("title", al2);

		
		return "/crawl/top";
	}
}
