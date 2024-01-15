package kr.co.ezen.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.ezen.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping("/")
	public String main() {
		
		
		return "main";
	}
	
	@RequestMapping("/result")
	public String result() {	
		return "result";
	}
	
	@RequestMapping("/result2")
	public String result2() {	
		return "result2";
	}
	@RequestMapping("/result3")
	public String result3() {	
		return "result3";
	}
	
	@RequestMapping("/result4")
	public String result4() {	
		return "result4";
	}
	@RequestMapping("/error")
	public String error() {	
		return "error";
	}
	
	
	
}
