package kr.ac.kopo.smartshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.ProductImage;
import kr.ac.kopo.smartshop.service.ProductService;
import kr.ac.kopo.smartshop.util.Pager;
import kr.ac.kopo.smartshop.util.Uploader;

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
	public String add(Product item, @RequestParam("productImage") List<MultipartFile> productImage) {
		List<ProductImage> list = new ArrayList<ProductImage>();
		try {
			Uploader<ProductImage> uploader = new Uploader<>();
			list = uploader.makeList(productImage, ProductImage.class);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		item.setImages(list);
		
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
	public String update(@PathVariable int code, Product item, @RequestParam("productImage") List<MultipartFile> productImage) {
		item.setCode(code);
		
		List<ProductImage> list = new ArrayList<ProductImage>();
		try {
			Uploader<ProductImage> uploader = new Uploader<>();
			list = uploader.makeList(productImage, ProductImage.class);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		item.setImages(list);
		
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
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable int code, Model model) {
		Product item = service.item(code);
		model.addAttribute("item", item);
		return PATH + "view";
	}
	
	
	@ResponseBody
	@GetMapping("/image/delete/{code}")
	public boolean imageDelete(@PathVariable int code) {
		return service.deleteImage(code);
	}
}
