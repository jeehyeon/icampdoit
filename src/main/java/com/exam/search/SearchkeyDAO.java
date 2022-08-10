package com.exam.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchkeyDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	public List<SearchkeyTO> searchkeyDAO(String keysearch) {
	      // TODO Auto-generated method stub
		
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId from go_api where facltNm like ? or addr1 like ? or induty like ?";
		ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+keysearch+"%", "%"+keysearch+"%","%"+keysearch+"%" );
		
		return datas;
	}
	
}