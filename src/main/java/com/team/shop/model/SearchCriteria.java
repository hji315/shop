package com.team.shop.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	private String product_category;
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", product_category="
				+ product_category + "]";
	}
	
}