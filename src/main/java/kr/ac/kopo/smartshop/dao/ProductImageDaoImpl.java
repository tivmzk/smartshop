package kr.ac.kopo.smartshop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.smartshop.model.ProductImage;

@Repository
public class ProductImageDaoImpl implements ProductImageDao {
	@Autowired
	SqlSession sql;
		
	@Override
	public void add(ProductImage image) {
		sql.insert("product_image.add", image);
	}

	@Override
	public void delete(int code) {
		sql.delete("product_image.delete", code);
	}

}
