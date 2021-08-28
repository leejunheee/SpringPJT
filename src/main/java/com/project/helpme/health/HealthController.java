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

	//건강/미용 메인 페이지 
	@RequestMapping(value = "/health/main.action", method = { RequestMethod.GET })
	public String main(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "health.main";
	}

	//사용자의 요청서 작성 페이지
	@RequestMapping(value = "/health/healthreq.action", method = { RequestMethod.GET })
	public String healthreq(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String subcategory) {
		
		//메인에서 카테고리 이미지 클릭시 넘어오는 매개변수 
		req.setAttribute("subcategory", subcategory);
		
		return "health.healthreq";
	}

	//요청서 작성 완료 
	@RequestMapping(value = "/health/healthreqok.action", method = { RequestMethod.POST })
	public void healthreqok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, HealthDTO dto) {
		
		//신청서 작성 페이지에서 넘어온 dto 추가 
		dao.add(dto);
	
		try {
			
			resp.sendRedirect("/helpme/health/healthlist.action");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//요청서 목록 
	@RequestMapping(value = "/health/healthlist.action", method = { RequestMethod.GET })
	public String healthlist(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		List<HealthDTO> list = dao.list();
		
		for (HealthDTO dto : list) {
			String regdate = dto.getRegdate();
			regdate = regdate.substring(2, 16);
			dto.setRegdate(regdate);
			
		}
		
		req.setAttribute("list", list);
		
		return "health.healthlist";
	}
	
	//요청서 상세보기 
	@RequestMapping(value = "/health/healthview.action", method = { RequestMethod.GET })
	public String healthview(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session,String healthseq) {
		
		
		HealthDTO dto = dao.get(healthseq);
		
		List<HealthApplyDTO> alist = dao.alist(healthseq);
		
		for (HealthApplyDTO adto : alist) {
			String regdate = adto.getRegdate();
			regdate = regdate.substring(2, 16);
			adto.setRegdate(regdate);
			
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("alist", alist);
		
		return "healthview";
	}
	
	//요청서 삭제 
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
	
	//요청서상세보기에서 수정 
	@RequestMapping(value = "/health/healthedit.action", method = { RequestMethod.POST })
	@ResponseBody
	public int healthedit(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session, HealthDTO dto) {
		

		return dao.edit(dto);
	}
	
	//---------------사용자 기능 ---------------
	
	//---------------헬퍼 기능 ----------------
	
	
	@RequestMapping(value = "/health/healthapply.action", method = { RequestMethod.GET })
	public String healthapply(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session, String healthseq) {
		

		return "health.healthapply";
	}
}
	
	







