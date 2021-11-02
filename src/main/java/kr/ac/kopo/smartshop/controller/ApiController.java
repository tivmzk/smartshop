package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.smartshop.dao.ProductImageDao;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.ProductImage;
import kr.ac.kopo.smartshop.service.ProductService;

@RequestMapping("/api")
@RestController // Controller + ResponseBody
public class ApiController {
	@Autowired
	ProductService service;
	@Autowired
	ProductImageDao imageDao;
	
	@GetMapping
	public List<Product> list(){
		return service.list();
	}
	
	@GetMapping("/{code}")
	public Product item(@PathVariable int code) {
		return service.item(code);
	}
	
	
	@PostMapping
	public void add(@RequestBody Product item) {
		service.add(item);
		
		if(item.getImages() != null) {
			for(ProductImage image : item.getImages()) {
				image.setProductCode(item.getCode());
				imageDao.add(image);
			}
		}
	}
	
	@PutMapping
	public void update(@RequestBody Product item) {
		service.update(item);
	}
	
	@DeleteMapping("/{code}")
	public void delete(@PathVariable int code) {
		service.delete(code);
	}
}
