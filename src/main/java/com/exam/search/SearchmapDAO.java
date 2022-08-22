package com.exam.search;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchmapDAO {
	
	@Autowired JdbcTemplate jdbcTemplate;
	
	public ArrayList<SearchkeyTO> listsigunguNm( String doValue ){
		
		String sql = "select distinct sigunguNm from go_api where doNm=?";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), doValue );
		
		return lists;
	}
	
	public SearchListMapTO searchmapList(SearchListMapTO listTO, SearchkeyTO sto){
		
		String sql = "select facltNm, doNm, sigunguNm, addr1, addr2, induty, firstImageUrl, contentId, mapX, mapY from go_api where doNm like ? and sigunguNm like ?";
		ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+sto.getDoNm()+"%", "%"+sto.getSigunguNm()+"%" );

		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		//총 게시글 수
		listTO.setTotalRecord( searchLists.size() );
		
		//총페이지 수
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;
		//cpage 1일땐 skip=0.. cpage2 일땐 skip=6		
		
		ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();
		
		//cpage 별로 나눠서 데이터 출력
		for( int i=0; i<recordPerPage ; i++ ) { //i가 0부터 5까지 증가
			if( skip+i != searchLists.size() ) {  //skip+i 해서 전체 데이터 출력
				SearchkeyTO to = new SearchkeyTO(); 
				to.setFacltNm( searchLists.get(skip+i).getFacltNm() );
				to.setAddr1( searchLists.get(skip+i).getAddr1() );
				to.setAddr2( searchLists.get(skip+i).getAddr2() );
				to.setInduty( searchLists.get(skip+i).getInduty() );				
				to.setFirstImageUrl( searchLists.get(skip+i).getFirstImageUrl() );
				to.setContentId( searchLists.get(skip+i).getContentId() );
				to.setDoNm( searchLists.get(skip+i).getDoNm() );  //얘넨 주석처리 해도 안해도 결과 잘 나옴
				to.setSigunguNm( searchLists.get(skip+i).getSigunguNm() );
				to.setMapX( searchLists.get(skip+i).getMapX() );
				to.setMapY( searchLists.get(skip+i).getMapY() );
				
				lists.add( to );
				
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
