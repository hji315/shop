package com.team.shop.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

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
		ArrayList<String> al3 = new ArrayList<>();
		
		//세틴
		String top_setin = "https://smartstore.naver.com/setinshop/category/dee12a9ae652482883678bc6f0d36935?cp=1";
		Connection conn_setin = Jsoup.connect(top_setin);
		Document doc_setin = conn_setin.get();
		Elements elem_setin = doc_setin.getElementsByClass("_25CKxIKjAk");
		for (Element element : elem_setin) {
			String img = element.attr("abs:src");
			al1.add(img);
		}
		Elements elem_setin2 = doc_setin.select(".QNNliuiAk3");
		for (int j = 0; j < elem_setin2.size(); j++) {
            String title = elem_setin2.get(j).text();		
            al2.add(title);
        }
		Elements elem_setin3 = doc_setin.select(".nIAdxeTzhx");
		for (int j = 0; j < elem_setin3.size(); j++) {
            String price = elem_setin3.get(j).text();
            al3.add(price);
        }
				
		//더모닝
		String top_themonin = "http://themonin.co.kr/product/list.html?cate_no=27";
		Connection conn_themonin = Jsoup.connect(top_themonin);
		Document doc_themonin = conn_themonin.get();
		
		Elements elem_themonin = doc_themonin.getElementsByClass("thumbs");
		for (Element element : elem_themonin) {
			String img = element.attr("abs:src");
			al1.add(img);
		}
		
		Elements elem_themonin2 = doc_themonin.select(".item_name");
		for (int j = 0; j < elem_themonin2.size(); j++) {
            String title = elem_themonin2.get(j).text();
            title = "[더모닌]"+title;
            al2.add(title);
        }
		
		Elements elem_themonin3 = doc_themonin.select("li.xans-record-:nth-child(1) > span:nth-child(1)");
		for (int j = 0; j < elem_themonin3.size(); j++) {
            String price = elem_themonin3.get(j).text();
            price=price.replace("KRW", "");
            al3.add(price);
        }

		
		
		long seed = System.nanoTime();
		Collections.shuffle(al1, new Random(seed));
		Collections.shuffle(al2, new Random(seed));
		Collections.shuffle(al3, new Random(seed));
		
		model.addAttribute("img", al1);
		model.addAttribute("title", al2);
		model.addAttribute("price", al3);
		
		return "/crawl/top";
	}
}
