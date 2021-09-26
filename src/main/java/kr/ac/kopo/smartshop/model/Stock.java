package kr.ac.kopo.smartshop.model;

//테이블에 매칭되지 않는 VO
public class Stock {
//	제품의 코드
	private int code;
//	제고양
	private int amount;
//	제품의 이름
	private String name;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
