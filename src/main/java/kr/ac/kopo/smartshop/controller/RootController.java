package kr.ac.kopo.smartshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.smartshop.model.Member;
import kr.ac.kopo.smartshop.service.MemberService;

@Controller
public class RootController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session) {
		if(memberService.login(member)) {
			session.setAttribute("member", member);
			return "redirect:.";
		}
		return "redirect:login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:.";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Member member) {
		memberService.add(member);
		return "redirect:.";
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		
		try {
			Thread.sleep(30*1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(memberService.checkId(id)) {
			return "OK";
		}
		return "FAIL";
	}
}
