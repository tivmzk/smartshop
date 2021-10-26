package kr.ac.kopo.smartshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.smartshop.dao.ProductDao;
import kr.ac.kopo.smartshop.dao.ProductImageDao;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.ProductImage;
import kr.ac.kopo.smartshop.util.Pager;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	@Autowired
	ProductImageDao productImageDao;
	
	@Override
	public List<Product> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.list(pager);
	}
	
	@Transactional
	@Override
	public void add(Product item) {
		dao.add(item);
		
		for(ProductImage image : item.getImeges()) {
			image.setProductCode(item.getCode());
			productImageDao.add(image);
		}
	}

	@Override
	public Product item(int code) {
		return dao.item(code);
	}

	@Override
	public void update(Product item) {
		dao.update(item);
	}

	@Override
	public void delete(int code) {
		dao.delete(code);
	}

	@Override
	public void dummy() {
		for(int i = 1; i < 100; i++) {
			Product item = new Product();
			item.setName("제품명 " + i);
			item.setSpec("규격 " + i);
			item.setCategory("카테고리 " + i);
			item.setManufacture("제조사 " + i);
			item.setPrice((int)(Math.random() * (50000 - 1000) + 1000) / 1000 * 1000);
			
			
			add(item);
		}
	}

	@Override
	public void init() {
		Pager pager = new Pager();
		do {
			List<Product> list = list(pager);
			
			if(list.size() == 0) break;
			
			for(Product item : list) {
				delete(item.getCode());
			}			
		}while(true);
		
	}
	
	@Override
	public List<Product> list() {
		Pager pager = new Pager();
		int total = dao.total(pager);
		pager.setTotal(total);
		pager.setPerPage(total);
		return dao.list(pager);
	}
}
