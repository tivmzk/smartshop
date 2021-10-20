package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.smartshop.model.Member;
import kr.ac.kopo.smartshop.model.Partner;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.Purchase;
import kr.ac.kopo.smartshop.service.PartnerService;
import kr.ac.kopo.smartshop.service.ProductService;
import kr.ac.kopo.smartshop.service.PurchaseService;
import kr.ac.kopo.smartshop.util.Pager;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	private final String PATH = "purchase/";
	
	@Autowired
	PurchaseService service;
	@Autowired
	ProductService productService;
	@Autowired
	PartnerService partnerService;
	
	@GetMapping({"/list", "/"})
	public String list(Model model, Pager pager) {
		List<Purchase> list = service.list(pager);
		model.addAttribute("list", list);
		
		return PATH + "list";
	}
	
	@GetMapping("/add")
	public String add(Model model, @SessionAttribute Member member) {
		List<Product> productList = productService.list();
		List<Partner> partnerList = partnerService.list();
		
		model.addAttribute("productList", productList);
		model.addAttribute("partnerList", partnerList);
		model.addAttribute("user", member.getId());
		
		return PATH + "add";
	}
	
	@PostMapping("/add")
	public String add(Purchase item, @SessionAttribute Member member) {
		item.setId(member.getId());
		service.add(item);
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Purchase item = service.item(code);
		
		List<Product> productList = productService.list();
		List<Partner> partnerList = partnerService.list();
		
		model.addAttribute("item", item);
		model.addAttribute("productList", productList);
		model.addAttribute("partnerList", partnerList);
		
		return PATH + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Purchase item) {
		item.setCode(code);
		service.update(item);
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		return "redirect:../list";
	}
}
