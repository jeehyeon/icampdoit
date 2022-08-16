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
	
		//campview 이미지 불러오기
	public ArrayList<SearchkeyTO> gocampimgparse(SearchkeyTO kto) {
			
		ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();
			
		try {
				
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document document = dBuilder.parse( new URL("https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList?ServiceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&contentId="+kto.getContentId()).openStream());
				
			Element root = document.getDocumentElement();
		    System.out.println( root.toString() );
		         
		    NodeList nList = document.getElementsByTagName("item"); 
		    	
		    for(int i = 0; i < nList.getLength(); i++) {
			//System.out.println(nList.item(i).getAttributes().getNamedItem("facltNm").getNodeValue());
			Node node = nList.item(i);
			SearchkeyTO ito = new SearchkeyTO();
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
		
					if(( getValue("imageUrl", element) != " " )){	
							try {	
								ito.setImageUrl(getValue("imageUrl", element));
								//System.out.println( "캠핑장 이미지 불러오기: " + ito.getImageUrl() );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								//System.out.println( "캠핑장명: 없음" );
								ito.setImageUrl( "default" );
							}
							lists.add(ito);	
												
						}
						
					}
				
			};
				//System.out.println("끝");
				
			} catch (ParserConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SAXException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//System.out.println("lists size:"+  lists.size() );
			return lists;
		
		}
		
		private static String getValue(String tag, Element element) {
			if(element.getElementsByTagName(tag).item(0)== null) {
				return " ";
			}
			NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
			Node node =(Node) nodes.item(0);	
			return node.getNodeValue();
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
			System.out.println("campViewCmtInsert() 호출") ;
			
			CampviewCmtTO dto = new CampviewCmtTO();
			String sql = "select seq from campview where contentId=?";
			dto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CampviewCmtTO>(CampviewCmtTO.class), cto.getContentId());
			//System.out.println("1@ : " + dto.getSeq());
			
			
			
			sql = "select seq, writer, content, ucode, mark from campview_cmt where cseq=?";
			ArrayList<CampviewCmtTO> clists = (ArrayList<CampviewCmtTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<CampviewCmtTO>(CampviewCmtTO.class), dto.getSeq());
						
			
			return clists;
		}
	
		// 상세검색DAO
		public SearchListTO searchdetailDAO(SearchListTO listTO, String doNmS, String doNmI, String doNmG, String indutyNor, String indutyCar, String indutyGl, String indutyVan, String lctClMount, String lctClForest, String lctClValley, String lctClCity, String lctClRiver, String lctClLake, String lctClBeach, String lctClIsland, String sbrsClElectro, String sbrsClHwater, String sbrsClGym, String sbrsClWifi, String sbrsClFirewood, String sbrsClPool, String sbrsClMart, String sbrsClCstore, String sbrsClWalk, String eqpmnLendClTent, String eqpmnLendClBrazier, String eqpmnLendClHeater, String eqpmnLendClTableware, String eqpmnLendClSbag, String eqpmnLendClRwire ) {
			  // TODO Auto-generated method stub
			System.out.println( "doNmS:"+doNmS);
			System.out.println( "doNmI:"+doNmI);
			System.out.println( "doNmG:"+doNmG);
			int cpage = listTO.getCpage();
			int recordPerPage = listTO.getRecordPerPage();
			int blockPerPage = listTO.getBlockPerPage();
			
			String sql = "select facltNm, doNm, sigunguNm, addr1, addr2, induty, firstImageUrl, contentId from go_api where (doNm like ? or doNm like ? or doNm like ?) and (induty like ? or induty like ? or induty like ? or induty like ?) and (lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ? or lctCl like ?) and (sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ? or sbrsCl like ?) and (eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ? or eqpmnLendCl like ?)";
			ArrayList<SearchkeyTO> searchLists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+doNmS+"%", "%"+doNmI+"%", "%"+doNmG+"%", "%"+indutyNor+"%", "%"+indutyCar+"%", "%"+indutyGl+"%", "%"+indutyVan+"%", "%"+lctClMount+"%", "%"+lctClForest+"%", "%"+lctClValley+"%", "%"+lctClCity+"%", "%"+lctClRiver+"%", "%"+lctClLake+"%", "%"+lctClBeach+"%", "%"+lctClIsland+"%", "%"+sbrsClElectro+"%", "%"+sbrsClHwater+"%", "%"+sbrsClGym+"%", "%"+sbrsClWifi+"%", "%"+sbrsClFirewood+"%", "%"+sbrsClPool+"%", "%"+sbrsClMart+"%", "%"+sbrsClCstore+"%", "%"+sbrsClWalk+"%", "%"+eqpmnLendClTent+"%", "%"+eqpmnLendClBrazier+"%", "%"+eqpmnLendClHeater+"%", "%"+eqpmnLendClTableware+"%", "%"+eqpmnLendClSbag+"%", "%"+eqpmnLendClRwire+"%");
			
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
}