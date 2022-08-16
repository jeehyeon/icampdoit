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
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId, mapX, mapY from go_api where doNm=? and sigunguNm=?";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), sto.getDoNm(), sto.getSigunguNm() );
		
		return lists;
	}
	
	public SearchListMapTO searchmapList(SearchListMapTO listTO, SearchkeyTO sto){
		
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId, mapX, mapY from go_api where doNm=? and sigunguNm=?";
		ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), sto.getDoNm(), sto.getSigunguNm() );
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		listTO.setTotalRecord( searchLists.size() );
		
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;
		
		ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != searchLists.size() ) {
				sto.setFacltNm( searchLists.get(skip+i).getFacltNm() );
				sto.setAddr1( searchLists.get(skip+i).getAddr1() );
				sto.setAddr2( searchLists.get(skip+i).getAddr2() );
				sto.setInduty( searchLists.get(skip+i).getInduty() );				
				sto.setFirstImageUrl( searchLists.get(skip+i).getFirstImageUrl() );
				sto.setContentId( searchLists.get(skip+i).getContentId() );
				sto.setDoNm( searchLists.get(skip+i).getDoNm() );
				sto.setSigunguNm( searchLists.get(skip+i).getSigunguNm() );
				
				lists.add( sto );
				
			} else { break; }
		}
		
		listTO.setSearchLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		
		return listTO;
	}

}
