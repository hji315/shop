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
	
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_size=" + product_size + ", product_color=" + product_color
				+ ", product_main_img=" + product_main_img + ", product_detail_img=" + product_detail_img
				+ ", product_detail=" + product_detail + ", product_category=" + product_category + ", product_url="
				+ product_url + ", product_stock=" + product_stock + ", product_new=" + product_new + "]";
	}
	
	public ProductVO() {
	}
	
	public ProductVO(int product_id, String product_name, int product_price, String product_size, String product_color,
			String product_main_img, String product_detail_img, String product_detail, String product_category,
			String product_url, int product_stock, int product_new) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_size = product_size;
		this.product_color = product_color;
		this.product_main_img = product_main_img;
		this.product_detail_img = product_detail_img;
		this.product_detail = product_detail;
		this.product_category = product_category;
		this.product_url = product_url;
		this.product_stock = product_stock;
		this.product_new = product_new;
	}
	
}
