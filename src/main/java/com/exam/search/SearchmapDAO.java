package com.exam.search;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchmapDAO {
	
	@Autowired JdbcTemplate jdbcTemplate;
	
	public ArrayList<SearchkeyTO> listdoNm(){
		
		String sql = "select distinct doNm from go_api";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class));
		
		return lists;
	}
	
	public ArrayList<SearchkeyTO> listsigunguNm( String doValue ){
		
		String sql = "select distinct sigunguNm from go_api where doNm=?";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), doValue );
		
		return lists;
	}
	
	public ArrayList<SearchkeyTO> listsearchmap(SearchkeyTO sto){
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId, mapX, mapY from go_api where sigunguNm=?";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), sto.getSigunguNm() );
		
		return lists;
	}

}
