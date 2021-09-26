package kr.ac.kopo.smartshop.service;

import java.util.List;

import kr.ac.kopo.smartshop.model.Purchase;
import kr.ac.kopo.smartshop.util.Pager;

public interface PurchaseService {

	List<Purchase> list(Pager pager);

	Purchase item(int code);

	void update(Purchase item);

	void delete(int code);

	void add(Purchase item);

}
