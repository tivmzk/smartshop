package kr.ac.kopo.smartshop.model;

import java.util.List;

public class Product {
	private int code;
	private String name;
	private String spec;
	private String category;
	private String manufacture;
	private int price;
	private String info;
	private String barcode;
	private List<ProductImage> imeges;
	
	
	
	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public List<ProductImage> getImeges() {
		return imeges;
	}

	public void setImeges(List<ProductImage> imeges) {
		this.imeges = imeges;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getManufacture() {
		return manufacture;
	}

	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
