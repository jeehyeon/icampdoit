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
	         
	        NodeList nList = document.getElementsByTagName("item"); 
						
			for(int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					
					SearchkeyTO kto = new SearchkeyTO();
					
					if(( getValue("doNm", element) != " " )){
						
						if( (getValue("doNm", element).toString().indexOf( sido )) != -1 ) {
							
							//1
							try {
								kto.setFacltNm( getValue("facltNm", element) );
							} catch (Exception e) {
								kto.setFacltNm( "default" );
							}
							//2
							try {
								kto.setAddr1( getValue("addr1", element) );
							} catch (Exception e) {
								kto.setAddr1( "default" );
							}
							//3
							try {
								kto.setAddr1( getValue("addr2", element) );
							} catch (Exception e) {
								kto.setAddr2( "default" );
							}
							//4
							try {
								kto.setInduty( getValue("induty", element) );
							} catch (Exception e) {
								kto.setInduty( "default" );
							}
							//5
							try {
								kto.setFirstImageUrl( getValue("firstImageUrl", element) );
							} catch (Exception e) {
								kto.setFirstImageUrl( "default" );
							}
							//6
							try {
								kto.setContentId( getValue("contentId", element) );
							} catch (Exception e) {
								kto.setContentId( "default" );
							}
							//7
							try {
								kto.setIntro( getValue("intro", element) );
							} catch (Exception e) {
								kto.setIntro( "default" );
							}
							//8
							try {
								kto.setAnimalCmgCl( getValue("animalCmgCl", element) );
							} catch (Exception e) {
								kto.setAnimalCmgCl( "default" );
							}
							//9
							try {
								kto.setTrlerAcmpnyAt( getValue("trlerAcmpnyAt", element) );
							} catch (Exception e) {
								kto.setTrlerAcmpnyAt( "default" );
							}
							//10
							try {
								kto.setCaravAcmpnyAt( getValue("caravAcmpnyAt", element) );
							} catch (Exception e) {
								kto.setCaravAcmpnyAt( "default" );
							}
							//11
							try {
								kto.setLctCl( getValue("lctCl", element) );
							} catch (Exception e) {
								kto.setLctCl( "default" );
							}
							//12
							try {
								kto.setBrazierCl( getValue("brazierCl", element) );
							} catch (Exception e) {
								kto.setBrazierCl( "default" );
							}
							//13
							try {
								kto.setSiteBottomCl1( getValue("siteBottomCl1", element) );
							} catch (Exception e) {
								kto.setSiteBottomCl1( "default" );
							}
							//14
							try {
								kto.setSiteBottomCl2( getValue("siteBottomCl2", element) );
							} catch (Exception e) {
								kto.setSiteBottomCl2( "default" );
							}
							//15
							try {
								kto.setSiteBottomCl3( getValue("siteBottomCl3", element) );
							} catch (Exception e) {
								kto.setSiteBottomCl3( "default" );
							}
							//16
							try {
								kto.setSiteBottomCl4( getValue("siteBottomCl4", element) );
							} catch (Exception e) {
								kto.setSiteBottomCl4( "default" );
							}
							//17
							try {
								kto.setSiteBottomCl5( getValue("siteBottomCl5", element) );
							} catch (Exception e) {
								kto.setSiteBottomCl5( "default" );
							}
							//18
							try {
								kto.setSbrsCl( getValue("sbrsCl", element) );
							} catch (Exception e) {
								kto.setSbrsCl( "default" );
							}
							//19
							try {
								kto.setDoNm( getValue("doNm", element) );
							} catch (Exception e) {
								kto.setDoNm( "default" );
							}
							//20
							try {
								kto.setEqpmnLendCl( getValue("eqpmnLendCl", element) );
							} catch (Exception e) {
								kto.setEqpmnLendCl( "default" );
							}
							//21
							try {
								kto.setHomepage( getValue("homepage", element) );
							} catch (Exception e) {
								kto.setHomepage( "default" );
							}
							//22
							try {
								kto.setMapX( getValue("mapX", element) );
							} catch (Exception e) {
								kto.setMapX( "default" );
							}
							//23
							try {
								kto.setMapY( getValue("mapY", element) );
							} catch (Exception e) {
								kto.setMapY( "default" );
							}
							//24 sigunguNm
							try {
								kto.setSigunguNm( getValue("sigunguNm", element) );
							} catch (Exception e) {
								kto.setSigunguNm( "default" );
							}
							
							lists.add(kto);
						}
						
					}
					
				}

			};
			
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return lists;
	
	}
	
	public int insertapi(ArrayList<SearchkeyTO> lists) {
		   
		   int flag = 1;
		   
		   for( SearchkeyTO kto : lists ) {
			   
			   String sql = "insert into go_api values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			   int result = jdbcTemplate.update(sql, kto.getFacltNm(), kto.getAddr1(), kto.getAddr2(), kto.getInduty(), kto.getFirstImageUrl(), kto.getContentId(), kto.getIntro(), kto.getAnimalCmgCl(), kto.getTrlerAcmpnyAt(), kto.getCaravAcmpnyAt(), kto.getLctCl(), kto.getBrazierCl(), kto.getSiteBottomCl1(), kto.getSiteBottomCl2(), kto.getSiteBottomCl3(), kto.getSiteBottomCl4(), kto.getSiteBottomCl5(), kto.getSbrsCl(), kto.getDoNm(), kto.getEqpmnLendCl(), kto.getHomepage(), kto.getMapX(), kto.getMapY(), kto.getSigunguNm()); 
			   
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
		         
		    NodeList nList = document.getElementsByTagName("item"); 
		    	
		    for(int i = 0; i < nList.getLength(); i++) {
			Node node = nList.item(i);
			
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
		
					if(( getValue("imageUrl", element) != " " )){	
							try {	
								String url = (getValue("imageUrl", element));
								
								 String sql = "insert into campviewimg values(0, ?, ?)";
								 int result = jdbcTemplate.update(sql, kto.getContentId(), url);
								 
							} catch (Exception e) {
								System.out.println( "insert 오류" );
								
							}
						
						}
						
					}
				
			};
				
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
	}
}

