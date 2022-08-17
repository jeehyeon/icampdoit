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
		
		System.out.println( "searchmapList DAO 호출()" );
		System.out.println( "sto.getDoNm 갑 보자: " + sto.getDoNm() );
		System.out.println( "sto.getgugunNm 갑 보자: " + sto.getSigunguNm() );
		
		String sql = "select facltNm, doNm, sigunguNm, addr1, addr2, induty, firstImageUrl, contentId, mapX, mapY from go_api where doNm like ? and sigunguNm like ?";
		ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), sto.getDoNm(), sto.getSigunguNm() );

		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		System.out.println( "cpage 뽑아봐봐 : " + listTO.getCpage() );
		System.out.println( "recordPerPage 뽑아봐봐 : " + listTO.getRecordPerPage() );
		System.out.println( "2번째 인덱스 값 : " + searchLists.get(1).getContentId() );
		
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
				//SearchkeyTO to = new SearchkeyTO(); 이거 하고 아래 sto 를 to 로 바꾸면 에러 남
				sto.setFacltNm( searchLists.get(skip+i).getFacltNm() );
				sto.setAddr1( searchLists.get(skip+i).getAddr1() );
				sto.setAddr2( searchLists.get(skip+i).getAddr2() );
				sto.setInduty( searchLists.get(skip+i).getInduty() );				
				sto.setFirstImageUrl( searchLists.get(skip+i).getFirstImageUrl() );
				sto.setContentId( searchLists.get(skip+i).getContentId() );
				//sto.setDoNm( searchLists.get(skip+i).getDoNm() );  //얘넨 주석처리 해도 안해도 결과 잘 나옴
				//sto.setSigunguNm( searchLists.get(skip+i).getSigunguNm() );
				sto.setMapX( searchLists.get(skip+i).getMapX() );
				sto.setMapY( searchLists.get(skip+i).getMapY() );
				
				lists.add( sto );
				
			} else { break; }
		}
		
		listTO.setSearchLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		
		System.out.println( "DoNm 뽑아봐봐 : " + sto.getDoNm() );
		
		return listTO;
	}

}
