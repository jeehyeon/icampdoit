package com.exam.home;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.mboard.BoardTO;
import com.exam.search.SearchkeyTO;


@Repository
public class HomeDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 캠핑장 정보
	public ArrayList<SearchkeyTO> campInfo() {	
			
		String sql = "select go_api.contentId, facltNm, firstImageUrl, doNm, sigunguNm from go_api inner join campview where go_api.contentId = campview.contentId order by hit desc limit 0,5";		
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class) );
				
		return lists;
	}
	

}
