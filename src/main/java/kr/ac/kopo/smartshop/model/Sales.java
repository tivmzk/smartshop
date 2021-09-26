package kr.ac.kopo.smartshop.model;

import java.util.Date;

public class Sales {
	private int code;
	private int product;
	private int partner;
	private int amount;
	private Date regDate;
	
	private String productName;
	private String partnerName;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getProduct() {
		return product;
	}
	public void setProduct(int product) {
		this.product = product;
	}
	public int getPartner() {
		return partner;
	}
	public void setPartner(int partner) {
		this.partner = partner;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getregDate() {
		return regDate;
	}
	public void setregDate(Date regDate) {
		this.regDate = regDate;
	}
}
