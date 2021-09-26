package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.service.ProductService;
import kr.ac.kopo.smartshop.util.Pager;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService service;
	
	private final String PATH = "product/";
	
	@RequestMapping({"/", "/list"})
	public String list(Model model, Pager pager) {
		List<Product> list = service.list(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return PATH+"list";
	}
	
	@GetMapping("/add")
	public String add() {
		return PATH+"add";
	}
	
	@PostMapping("/add")
	public String add(Product item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Product item = service.item(code);
		model.addAttribute("item", item);
		
		return PATH+"update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Product item) {
		item.setCode(code);
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		return "redirect:../list";
	}
	
	@GetMapping("/dummy")
	public String dummy() {
		service.dummy();
		return "redirect:list";
	}
	
	@GetMapping("/init")
	public String init() {
		service.init();
		return "redirect:list";
	}
}
