package kr.ac.kopo.smartshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.smartshop.dao.ProductImageDao;

@Service
public class ProductImageServiceImpl implements ProductImageService {
	@Autowired
	ProductImageDao dao;
	
	@Override
	public void delete(int code) {
		dao.delete(code);
	}

}
