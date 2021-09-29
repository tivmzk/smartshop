package kr.ac.kopo.smartshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.smartshop.dao.MemberDao;
import kr.ac.kopo.smartshop.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	public boolean login(Member member) {
		Member item = dao.item(member);
		
		if(item != null) {
			member.setPassword(null);
			member.setAddress(item.getAddress());
			member.setTel(item.getTel());
			return true;
		}
		
		return false;
	}

}
