package kr.ac.kopo.smartshop.controller;

import java.util.HashMap;
import java.util.Map;

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
import kr.ac.kopo.smartshop.util.Pager;

@RequestMapping("/api")
@RestController // Controller + ResponseBody
public class ApiController {
	@Autowired
	ProductService service;
	@Autowired
	ProductImageDao imageDao;
	
	@GetMapping
	public Map<String, Object> list(Pager pager){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.list(pager));
		map.put("pager", pager);
		return map;
	}
	
	@GetMapping("/{code}")
	public Product item(@PathVariable int code) {
		return service.item(code);
	}
	
	
	@PostMapping
	public Map<String, Object> add(@RequestBody Product item, Pager pager) {
		service.add(item);
		
		if(item.getImages() != null) {
			for(ProductImage image : item.getImages()) {
				image.setProductCode(item.getCode());
				imageDao.add(image);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		map.put("pager", pager);
		return map;
	}
	
	@PutMapping
	public Product update(@RequestBody Product item) {
		service.update(item);
		return item;
	}
	
	@DeleteMapping("/{code}")
	public boolean delete(@PathVariable int code) {
		service.delete(code);
		return true;
	}
}
