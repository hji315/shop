package com.team.shop.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductVO {
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_size;
	private String product_color;
	private String product_main_img;
	private String product_detail_img;
	private String product_detail;
	private String product_category;
	private String product_url;
	private int product_stock;
	private int product_new;
	private int hit;
	
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_size=" + product_size + ", product_color=" + product_color
				+ ", product_main_img=" + product_main_img + ", product_detail_img=" + product_detail_img
				+ ", product_detail=" + product_detail + ", product_category=" + product_category + ", product_url="
				+ product_url + ", product_stock=" + product_stock + ", product_new=" + product_new + ", hit=" + hit
				+ "]";
	}	
}
