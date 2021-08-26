package com.project.helpme.health;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HealthController {
	
	@Autowired
	private HealthDAO dao;

	@RequestMapping(value = "/health/healthtest.action", method = { RequestMethod.GET })
	public String healthtest(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		

		return "health.healthtest";
	}
	@RequestMapping(value = "/health/main.action", method = { RequestMethod.GET })
	public String main(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "health.main";
	}

	@RequestMapping(value = "/health/healthreq.action", method = { RequestMethod.GET })
	public String healthreq(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String subcategory) {
		
		req.setAttribute("subcategory", subcategory);
		
		return "health.healthreq";
	}

	@RequestMapping(value = "/health/healthreqok.action", method = { RequestMethod.POST })
	public void healthreqok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, HealthDTO dto) {
		
		dao.add(dto);
	
		try {
			
			resp.sendRedirect("/helpme/health/healthlist.action");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/health/healthlist.action", method = { RequestMethod.GET })
	public String healthlist(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		List<HealthDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		return "health.healthlist";
	}
	
	@RequestMapping(value = "/health/healthview.action", method = { RequestMethod.GET })
	public String healthview(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session,String healthseq) {
		
		
		HealthDTO dto = dao.get(healthseq);
		
		req.setAttribute("dto", dto);
		
		return "healthview";
	}
	
	@RequestMapping(value = "/health/healthdel.action", method = { RequestMethod.GET })
	public void healthdel(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session, String healthseq) {
		
		dao.del(healthseq);
	
		try {
			
			resp.sendRedirect("/helpme/health/healthlist.action");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/health/healthedit.action", method = { RequestMethod.POST })
	@ResponseBody
	public int healthedit(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session, HealthDTO dto) {
		

		return dao.edit(dto);
	}
	
}







