package com.springstudy.jj.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springstudy.jj.domain.Member;
import com.springstudy.jj.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입
	@RequestMapping(value="/joinResult", method=RequestMethod.POST)
	public String joinResult(Member m) {
		
		
		// MemberService를 통해서 사용자 정보를 DB에 저장
		memberService.addMember(m);
		
		System.out.println(m.getId());
		System.out.println(m.getName());
		System.out.println(m.getPass());
		System.out.println(m.getZipcode());
		System.out.println(m.getAddress1());
		System.out.println(m.getAddress2());
		System.out.println(m.getEmail());
		System.out.println(m.getPhone());
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {
		
		boolean overlap = memberService.overlapIdCheck(id);
		model.addAttribute("id", id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/overlapIdCheck.jsp";
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model, @RequestParam("userId") String id, String pass, HttpSession session, HttpServletResponse response, PrintWriter out) {
		
		System.out.println("id : " + id);
		System.out.println("pass : " + pass);
		
		int result = memberService.login(id, pass);
		if(result == -1) {// 회원 아이디가 없는 경우
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('회원 아이디가 존재하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
			
		}else if(result == 0) { // 비밀번호가 틀린 경우
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		// 로그인 성공인 경우
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);
		
		session.setAttribute("member", member);
		
		return "redirect:boardList";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:boardList";
		}
	
}
