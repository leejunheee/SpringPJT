package com.project.helpme.health;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HealthController {

	@RequestMapping(value = "/health/healthtest.action", method = { RequestMethod.GET })
	public String healthtest(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		

		return "health.healthtest";
	}
	@RequestMapping(value = "/health/main.action", method = { RequestMethod.GET })
	public String main(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "health.main";
	}

	@RequestMapping(value = "/health/healthreq.action", method = { RequestMethod.GET })
	public String healthreq(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "health.healthreq";
	}
}
