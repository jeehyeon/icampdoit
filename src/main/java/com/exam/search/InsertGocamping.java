package com.exam.search;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.exam.mboard.BoardTO;

@Repository
public class InsertGocamping {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static String getValue(String tag, Element element) {
		if(element.getElementsByTagName(tag).item(0)== null) {
			return " ";
		}
		NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
		Node node =(Node) nodes.item(0);	
		return node.getNodeValue();
	}
	
	public ArrayList<SearchkeyTO> gocampingparse(String sido) {
		
		ArrayList<SearchkeyTO> lists = new ArrayList<SearchkeyTO>();
		
		try {
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document document = dBuilder.parse( new URL("https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D&numOfRows=3107&pageNo=1&MobileOS=ETC&MobileApp=TestApp").openStream());
			
			Element root = document.getDocumentElement();
	        System.out.println( root.toString() );
	         
	        NodeList nList = document.getElementsByTagName("item"); 
						
			for(int i = 0; i < nList.getLength(); i++) {
				//System.out.println(nList.item(i).getAttributes().getNamedItem("facltNm").getNodeValue());
				Node node = nList.item(i);
				
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					
					SearchkeyTO kto = new SearchkeyTO();
					
					if(( getValue("doNm", element) != " " )){
						
						if( (getValue("doNm", element).toString().indexOf( sido )) != -1 ) {
							
							//1
							try {
								System.out.println( "캠핑장명: " + getValue("facltNm", element) );
								kto.setFacltNm( getValue("facltNm", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장명: 없음" );
								kto.setFacltNm( "default" );
							}
							//2
							try {
								System.out.println( "캠핑장 주소1: " + getValue("addr1", element) );
								kto.setAddr1( getValue("addr1", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장주소1: 없음" );
								kto.setAddr1( "default" );
							}
							//3
							try {
								System.out.println( "캠핑장 주소2: " + getValue("addr2", element) );
								kto.setAddr1( getValue("addr2", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장주소2: 없음" );
								kto.setAddr2( "default" );
							}
							//4
							try {
								System.out.println( "캠핑장 유형: " + getValue("induty", element) );
								kto.setInduty( getValue("induty", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장 유형: 없음" );
								kto.setInduty( "default" );
							}
							//5
							try {
								System.out.println( "대표이미지: " + getValue("firstImageUrl", element) );
								kto.setFirstImageUrl( getValue("firstImageUrl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "대표이미지: 없음" );
								kto.setFirstImageUrl( "default" );
							}
							//6
							try {
								System.out.println( "캠핑장 아이디: " + getValue("contentId", element) );
								kto.setContentId( getValue("contentId", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장 아이디: 없음" );
								kto.setContentId( "default" );
							}
							//7
							try {
								System.out.println( "캠핑장 소개: " + getValue("intro", element) );
								kto.setIntro( getValue("intro", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장 소개: 없음" );
								kto.setIntro( "default" );
							}
							//8
							try {
								System.out.println( "애완동물동반: " + getValue("animalCmgCl", element) );
								kto.setAnimalCmgCl( getValue("animalCmgCl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "애완동물동반: 없음" );
								kto.setAnimalCmgCl( "default" );
							}
							//9
							try {
								System.out.println( "개인트레일러입장: " + getValue("trlerAcmpnyAt", element) );
								kto.setTrlerAcmpnyAt( getValue("trlerAcmpnyAt", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "개인트레일러입장: 없음" );
								kto.setTrlerAcmpnyAt( "default" );
							}
							//10
							try {
								System.out.println( "개인카라반입장: " + getValue("caravAcmpnyAt", element) );
								kto.setCaravAcmpnyAt( getValue("caravAcmpnyAt", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "개인카라반입장: 없음" );
								kto.setCaravAcmpnyAt( "default" );
							}
							//11
							try {
								System.out.println( "입지: " + getValue("lctCl", element) );
								kto.setLctCl( getValue("lctCl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "입지: 없음" );
								kto.setLctCl( "default" );
							}
							//12
							try {
								System.out.println( "화로대 사용가능여부: " + getValue("brazierCl", element) );
								kto.setBrazierCl( getValue("brazierCl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "화로대 사용가능여부: 없음" );
								kto.setBrazierCl( "default" );
							}
							//13
							try {
								System.out.println( "바닥형태-잔디: " + getValue("siteBottomCl1", element) );
								kto.setSiteBottomCl1( getValue("siteBottomCl1", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "바닥형태-잔디: 없음" );
								kto.setSiteBottomCl1( "default" );
							}
							//14
							try {
								System.out.println( "바닥형태-파쇄석: " + getValue("siteBottomCl2", element) );
								kto.setSiteBottomCl2( getValue("siteBottomCl2", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "바닥형태-파쇄석: 없음" );
								kto.setSiteBottomCl2( "default" );
							}
							//15
							try {
								System.out.println( "바닥형태-테크: " + getValue("siteBottomCl3", element) );
								kto.setSiteBottomCl3( getValue("siteBottomCl3", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "바닥형태-테크: 없음" );
								kto.setSiteBottomCl3( "default" );
							}
							//16
							try {
								System.out.println( "바닥형태-자갈: " + getValue("siteBottomCl4", element) );
								kto.setSiteBottomCl4( getValue("siteBottomCl4", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "바닥형태-자갈: 없음" );
								kto.setSiteBottomCl4( "default" );
							}
							//17
							try {
								System.out.println( "바닥형태-맨흙: " + getValue("siteBottomCl5", element) );
								kto.setSiteBottomCl5( getValue("siteBottomCl5", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "바닥형태-맨흙: 없음" );
								kto.setSiteBottomCl5( "default" );
							}
							//18
							try {
								System.out.println( "캠핑장 시설정보: " + getValue("sbrsCl", element) );
								kto.setSbrsCl( getValue("sbrsCl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장 시설정보: 없음" );
								kto.setSbrsCl( "default" );
							}
							//19
							try {
								System.out.println( "시/도: " + getValue("doNm", element) );
								kto.setDoNm( getValue("doNm", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "시/도: 없음" );
								kto.setDoNm( "default" );
							}
							//20
							try {
								System.out.println( "캠핑장비대여: " + getValue("eqpmnLendCl", element) );
								kto.setEqpmnLendCl( getValue("eqpmnLendCl", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장비대여: 없음" );
								kto.setEqpmnLendCl( "default" );
							}
							//21
							try {
								System.out.println( "캠핑장 사이트주소: " + getValue("homepage", element) );
								kto.setHomepage( getValue("homepage", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "캠핑장 사이트주소: 없음" );
								kto.setHomepage( "default" );
							}
							//22
							try {
								System.out.println( "경도(X): " + getValue("mapX", element) );
								kto.setMapX( getValue("mapX", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "경도(X): 없음" );
								kto.setMapX( "default" );
							}
							//23
							try {
								System.out.println( "위도(Y): " + getValue("mapY", element) );
								kto.setMapY( getValue("mapY", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "위도(Y): 없음" );
								kto.setMapY( "default" );
							}
							//24 sigunguNm
							try {
								System.out.println( "시군구: " + getValue("sigunguNm", element) );
								kto.setSigunguNm( getValue("sigunguNm", element) );
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "시군구: 없음" );
								kto.setSigunguNm( "default" );
							}
							
							lists.add(kto);
						}
						
					}
					
				}

			};
			System.out.println("끝");
			
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
		
		//System.out.println( lists );
		return lists;
	
	}
	
	public int insertapi(ArrayList<SearchkeyTO> lists) {
		   
		   int flag = 1;
		   //System.out.println( lists );
		   
		   for( SearchkeyTO kto : lists ) {
			   
			   String sql = "insert into go_api values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			   int result = jdbcTemplate.update(sql, kto.getFacltNm(), kto.getAddr1(), kto.getAddr2(), kto.getInduty(), kto.getFirstImageUrl(), kto.getContentId(), kto.getIntro(), kto.getAnimalCmgCl(), kto.getTrlerAcmpnyAt(), kto.getCaravAcmpnyAt(), kto.getLctCl(), kto.getBrazierCl(), kto.getSiteBottomCl1(), kto.getSiteBottomCl2(), kto.getSiteBottomCl3(), kto.getSiteBottomCl4(), kto.getSiteBottomCl5(), kto.getSbrsCl(), kto.getDoNm(), kto.getEqpmnLendCl(), kto.getHomepage(), kto.getMapX(), kto.getMapY(), kto.getSigunguNm()); 

			   //String sql = "insert into go_api ( facltNm, addr1, addr2, induty, firstImageUrl, contentId, intro, animalCmgCl, trlerAcmpnyAt, caravAcmpnyAt, lctCl, brazierCl, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, sbrsCl, doNm, eqpmnLendCl, homepage, mapX, mapY ) select ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? from dual where not exists ( select facltNm from go_api where facltNm=? )";
			   //int result = jdbcTemplate.update(sql, kto.getFacltNm(), kto.getAddr1(), kto.getAddr2(), kto.getInduty(), kto.getFirstImageUrl(), kto.getContentId(), kto.getIntro(), kto.getAnimalCmgCl(), kto.getTrlerAcmpnyAt(), kto.getCaravAcmpnyAt(), kto.getLctCl(), kto.getBrazierCl(), kto.getSiteBottomCl1(), kto.getSiteBottomCl2(), kto.getSiteBottomCl3(), kto.getSiteBottomCl4(), kto.getSiteBottomCl5(), kto.getSbrsCl(), kto.getDoNm(), kto.getEqpmnLendCl(), kto.getHomepage(), kto.getMapX(), kto.getMapY(), kto.getFacltNm() ); 
			   
			   System.out.println( result );
			   
			   if( result != 1 ) {
					System.out.println( "insertapi 오류" );
					flag = 1;
				} else {
					flag=0;
				}
		   }
		   
		   return flag;
	   }
	
	
	
	public ArrayList<SearchkeyTO> contentIdList() {
		
		String sql = "select contentId from go_api";
		ArrayList<SearchkeyTO> lists = (ArrayList<SearchkeyTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class) );
		
		return lists;		
	}
	
	
	
	
	public void insertImage(SearchkeyTO kto) {
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
			
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
		
					if(( getValue("imageUrl", element) != " " )){	
							try {	
								String url = (getValue("imageUrl", element));
								//System.out.println( "캠핑장 이미지 불러오기: " + ito.getImageUrl() );
								
								 String sql = "insert into campviewimg values(0, ?, ?)";
								 int result = jdbcTemplate.update(sql, kto.getContentId(), url);
								 System.out.println("i : " + result);
								 
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println( "insert 오류" );
								
							}
						
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
		
	}
}

