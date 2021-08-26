package com.project.helpme.health;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthDAO {

	@Autowired
	private SqlSessionTemplate template;

	public void add(HealthDTO dto) {
		
		template.insert("health.add",dto);
		
	}

	public List<HealthDTO> list() {
		
		
		return template.selectList("health.list");
	}

	public HealthDTO get(String healthseq) {
		
		return template.selectOne("health.get",healthseq);
	}

	public void del(String healthseq) {
		
		template.delete("health.del",healthseq);
		
	}

	public int edit(HealthDTO dto) {
		
		return template.update("health.edit",dto);
	}
	
	
}
