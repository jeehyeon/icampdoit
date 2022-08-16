package com.exam.search;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.CmtTO;
import com.exam.mboard.FileTO;

@Repository
public class SearchkeyDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	public SearchListTO searchkeyList(SearchListTO listTO, String keysearch) {
	      // TODO Auto-generated method stub
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
				
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId, doNm, sigunguNm from go_api where facltNm like ? or addr1 like ? or induty like ?";
		ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+keysearch+"%", "%"+keysearch+"%","%"+keysearch+"%" );
		
		listTO.setTotalRecord( searchLists.size() );
		
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;	
		
		ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != searchLists.size() ) {
				SearchkeyTO kto = new SearchkeyTO();
				kto.setFacltNm( searchLists.get(skip+i).getFacltNm() );
				kto.setAddr1( searchLists.get(skip+i).getAddr1() );
				kto.setAddr2( searchLists.get(skip+i).getAddr2() );
				kto.setInduty( searchLists.get(skip+i).getInduty() );				
				kto.setFirstImageUrl( searchLists.get(skip+i).getFirstImageUrl() );
				kto.setContentId( searchLists.get(skip+i).getContentId() );
				kto.setDoNm( searchLists.get(skip+i).getDoNm() );
				kto.setSigunguNm( searchLists.get(skip+i).getSigunguNm() );
				
				lists.add( kto );
				
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
	
	//campview 테이블이 존재하는 지 검사
	public SearchkeyTO campViewTableExist(SearchkeyTO kto) {
	      // TODO Auto-generated method stub
		
		try {
			String sql = "select seq, contentId from campview where contentId=?";
			kto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), kto.getContentId());
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			kto.setSeq("-1");
			
		}
		
		return kto;
	}
	//DBINSERT campview
	public int campViewTableInsert(SearchkeyTO kto) {	
		
		int flag = 1;
		
		
		
		String sql = "insert into campview values  ( 0, ?, 1)";
		int result = jdbcTemplate.update(sql, kto.getContentId());
					System.out.println(result);
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("campViewTableInsert 오류");
			return flag;	
		}else {
			flag=0;
		}
		return flag;
	}
	
	//campview 조회수
	public int campViewHit(SearchkeyTO kto) {	
		int flag = 1;
		String sql = "update campview set hit=hit+1 where contentId=?";
		int result = jdbcTemplate.update(sql, kto.getContentId() );
		//System.out.println("campViewHit 조회수 메서드 : " + result);
		if( result != 1 ) {
			System.out.println("campViewHit 오류");
			return flag;	
		}else {
			flag=0;
		}
		return flag;
	}
	
	
	// campview
	public SearchkeyTO campView(SearchkeyTO kto) {	
			
		String sql = "select * from go_api where contentId=?";		
		kto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), kto.getContentId() );
			
	return kto;
	}
	
	// 찜하기
		public int campSubscribe(String ucode, String contentId) {	
			int flag=1;
			String sql = "insert into subscribe values  ( 0, ?, ?)";
			int result = jdbcTemplate.update(sql, contentId, ucode);
			System.out.println(result);
			if( result != 1 ) {
				System.out.println("campViewTableInsert 오류");
				return flag;	
			}else {
				flag=0;
			}
			return flag;	
		
		}
		// 찜하기 체크
	public int campSubscribeCheck(String ucode, String contentId) {	
			int flag=1;
			String result;
			try {
				String sql = "select seq from subscribe where ucode=? and contentId=? ";
				result = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<String>(String.class), ucode, contentId);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				return flag;
			}
			System.out.println(" result : "+result);
			if( result!=""&&result!=null) {
				flag=0;
			}
			return flag;	
				
	}	
	//찜삭제
	public int campSubscribeDel(String ucode, String contentId) {	
		int flag=1;
		String sql = "delete from subscribe where ucode=? and contentId=?";
		int result = jdbcTemplate.update(sql, ucode, contentId);
		System.out.println(result);
		if( result != 1 ) {
			System.out.println("campSubscribeDel 오류");
			return flag;	
		}else {
			flag=0;
		}
		return flag;	
	
	}
	
		//campview 이미지 불러오기
	public ArrayList<SearchkeyTO> gocampimgparse(SearchkeyTO kto) {
		System.out.println("컨텐츠 아이디DAO : "+kto.getContentId());
		String sql = "select imgurl from campviewimg where contentId=?";
		ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), kto.getContentId());
		
		return searchLists;
		}
		
		//DBINSERT campviewCmt
		public int campViewCmtInsert(CampviewCmtTO cto) {
			System.out.println("campViewCmtInsert() 호출") ;
			int flag = 1;
			CampviewCmtTO dto = new CampviewCmtTO();
			String sql = "select seq from campview where contentId=?";
			dto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CampviewCmtTO>(CampviewCmtTO.class), cto.getContentId());
			//System.out.println("1@ : " + dto.getSeq());
			
			
			
			sql = "insert into campview_cmt values ( 0, ?, ?, ?, now(), ?, ?)";
			int result = jdbcTemplate.update(sql, dto.getSeq(), cto.getWriter(), cto.getContent(), cto.getUcode(), cto.getMark());
						System.out.println(result);
			System.out.println("2@");
			//위에 들어가 부분에 seq값을 다시 들고 나와야 함
			if( result != 1 ) {
				System.out.println("campViewCmtInsert 오류");
				return flag;	
			}else {
				flag=0;
			}
			return flag;
		}
		
		
		public ArrayList<CampviewCmtTO> campViewCmt(CampviewCmtTO cto) {
			System.out.println("campViewCmt() 호출") ;
			
			CampviewCmtTO dto = new CampviewCmtTO();
			String sql = "select seq from campview where contentId=?";
			dto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CampviewCmtTO>(CampviewCmtTO.class), cto.getContentId());
			System.out.println("1@ : " + dto.getSeq());
			
			
			
			sql = "select seq, writer, content, ucode, mark from campview_cmt where cseq=?";
			ArrayList<CampviewCmtTO> clists = (ArrayList<CampviewCmtTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<CampviewCmtTO>(CampviewCmtTO.class), dto.getSeq());
						
			
			return clists;
		}
	
		// 상세검색DAO
				public SearchListTO searchdetailDAO(SearchListTO listTO, String doNmS, String doNmI, String doNmG, String indutyNor, String indutyCar, String indutyGl, String indutyVan, String lctClMount, String lctClForest, String lctClValley, String lctClCity, String lctClRiver, String lctClLake, String lctClBeach, String lctClIsland, String siteBottomCl1, String siteBottomCl2, String siteBottomCl3, String siteBottomCl4, String siteBottomCl5, String sbrsClElectro, String sbrsClHwater, String sbrsClGym, String sbrsClWifi, String sbrsClFirewood, String sbrsClPool, String sbrsClMart, String sbrsClCstore, String sbrsClWalk, String eqpmnLendClTent, String eqpmnLendClBrazier, String eqpmnLendClHeater, String eqpmnLendClTableware, String eqpmnLendClSbag, String eqpmnLendClRwire, String trlerAcmpnyAt, String caravAcmpnyAt, String animalCmgCl ) {
					  // TODO Auto-generated method stub
					
					//System.out.println( "sitebottom1 : " + siteBottomCl1);
					//System.out.println( "sitebottom2 : " + siteBottomCl2);
					//System.out.println( "sitebottom3 : " + siteBottomCl3);
					//System.out.println( "sitebottom4 : " + siteBottomCl4);
					//System.out.println( "sitebottom5 : " + siteBottomCl5);
					
					int cpage = listTO.getCpage();
					int recordPerPage = listTO.getRecordPerPage();
					int blockPerPage = listTO.getBlockPerPage();
					
					String sql = "select facltNm, doNm, sigunguNm, addr1, addr2, induty, firstImageUrl, contentId from go_api where (doNm like ? or doNm like ? or doNm like ?) and (induty like ? or induty like ? or induty like ? or induty like ?) and (lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ?) and (siteBottomCl1 != ? or siteBottomCl2 != ? or siteBottomCl3 != ? or siteBottomCl4 != ? or siteBottomCl5 != ?) and (sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ?) and (eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ?) and trlerAcmpnyAt like ? and caravAcmpnyAt like ? and animalCmgCl != ?";
					ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+doNmS+"%", "%"+doNmI+"%", "%"+doNmG+"%", "%"+indutyNor+"%", "%"+indutyCar+"%", "%"+indutyGl+"%", "%"+indutyVan+"%", "%"+lctClMount+"%", "%"+lctClForest+"%", "%"+lctClValley+"%", "%"+lctClCity+"%", "%"+lctClRiver+"%", "%"+lctClLake+"%", "%"+lctClBeach+"%", "%"+lctClIsland+"%", siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, "%"+sbrsClElectro+"%", "%"+sbrsClHwater+"%", "%"+sbrsClGym+"%", "%"+sbrsClWifi+"%", "%"+sbrsClFirewood+"%", "%"+sbrsClPool+"%", "%"+sbrsClMart+"%", "%"+sbrsClCstore+"%", "%"+sbrsClWalk+"%", "%"+eqpmnLendClTent+"%", "%"+eqpmnLendClBrazier+"%", "%"+eqpmnLendClHeater+"%", "%"+eqpmnLendClTableware+"%", "%"+eqpmnLendClSbag+"%", "%"+eqpmnLendClRwire+"%", "%"+trlerAcmpnyAt+"%", "%"+caravAcmpnyAt+"%", animalCmgCl);
					
					listTO.setTotalRecord( searchLists.size() );
					
					listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
					int skip = ( cpage - 1 ) * recordPerPage;	
					
					ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();		
					for( int i=0; i<recordPerPage ; i++ ) {
						if( skip+i != searchLists.size() ) {
							SearchkeyTO kto = new SearchkeyTO();
							kto.setFacltNm( searchLists.get(skip+i).getFacltNm() );
							kto.setAddr1( searchLists.get(skip+i).getAddr1() );
							kto.setAddr2( searchLists.get(skip+i).getAddr2() );
							kto.setInduty( searchLists.get(skip+i).getInduty() );				
							kto.setFirstImageUrl( searchLists.get(skip+i).getFirstImageUrl() );
							kto.setContentId( searchLists.get(skip+i).getContentId() );
							kto.setDoNm( searchLists.get(skip+i).getDoNm() );
							kto.setSigunguNm( searchLists.get(skip+i).getSigunguNm() );
							
							lists.add( kto );
							
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
				
				
				//delete Comment
	public int campviewDeleteComment( SearchkeyTO kto ) {
					
		int flag = 1;
					
		String sql = "delete from campview_cmt where seq=?";
		int result = jdbcTemplate.update(sql, kto.getSeq());
		System.out.println(result);

		if( result != 1 ) {
			System.out.println("m_cmt Delete 오류");
		}else {
			flag=0;
		}
					
		return flag;
	}
				
}