package com.gz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JumpController {
	
	@RequestMapping("jump.do")
	public String jump(String target) {
		
		return target;
	}
}
