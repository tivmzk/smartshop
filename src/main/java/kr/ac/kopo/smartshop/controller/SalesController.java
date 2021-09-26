package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.smartshop.model.Partner;
import kr.ac.kopo.smartshop.model.Sales;
import kr.ac.kopo.smartshop.model.Stock;
import kr.ac.kopo.smartshop.service.PartnerService;
import kr.ac.kopo.smartshop.service.SalesService;
import kr.ac.kopo.smartshop.util.Pager;

@Controller
@RequestMapping("/sales")
public class SalesController {
	final String PATH = "sales/";
	final String REDIRECT_LIST = "redirect:list";
	final String REDIRECT_BACK_LIST = "redirect:../list";
	
	@Autowired
	SalesService service;
	@Autowired
	PartnerService partnerService;
	
	@RequestMapping({"/", "/list"})
	public String list(Model model, Pager pager) {
		List<Sales> list = service.list(pager);
		model.addAttribute("list", list);
		
		return PATH + "list";
	}
	
	@GetMapping("/add")
	public String add(Model model) {
		List<Stock> stockList = service.stock();
		List<Partner> partnerList = partnerService.list();
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("partnerList", partnerList);
		
		return PATH + "add";
	}
	
	@PostMapping("/add")
	public String add(Sales item) {
		service.add(item);
		return REDIRECT_LIST;
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Sales item = service.item(code);
		List<Stock> stockList = service.stock();
		List<Partner> partnerList = partnerService.list();
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("partnerList", partnerList);
		model.addAttribute("item", item);
		return PATH + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Sales item) {
		item.setCode(code);
		service.update(item);
		return REDIRECT_BACK_LIST;
	}
	
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		return REDIRECT_BACK_LIST;
	}
}
