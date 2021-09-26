package kr.ac.kopo.smartshop.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	/**
	 * @value 현재 페이지
	 */
	private int page = 1;
	/**
	 * @value 한 페이지가 보여줄 개수
	 */
	private int perPage = 10;
	/**
	 * @value DB에 전부 몇개 있나
	 */
	private float total;
	/**
	 * @value 페이지를 몇개 보여주나
	 */
	private int perGroup = 5;
	/**
	 * @value 검색하는 keyword의 종류를 표시
	 */
	private int search = 0;
	/**
	 * @value 검색하는 내용
	 */
	private String keyword;
	
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	public int getOffset() {
		return (getPage() - 1) * getPerPage();
	}
	public int getNext() {
		int next = ((page - 1) / perGroup + 1) * perGroup + 1;
		int end = getEnd();
		
		if(next > end)
			next = end;
		
		return next;
	}
	public int getPrev() {
		return page <= perGroup ? 1 : ((page - 1) / perGroup - 1) * perGroup + 1;
	}
	public int getEnd() {
		int end = 0;
		
		end = (int)(Math.ceil(total / perPage));
		
		return end < 1 ? 1 : end;
	}
	public List<Integer> getList(){
		List<Integer> list = new ArrayList<Integer>();
		
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		
		for(int i = startPage; i < startPage + perGroup && i <= getEnd(); i++) {
			list.add(i);
		}
		
		if(list.isEmpty()) list.add(1);
		
		return list;
	}
	public String getQuery() {
		if(search < 1)
			return "";
		
		return String.format("search=%d&keyword=%s", search, keyword);
	}
}
