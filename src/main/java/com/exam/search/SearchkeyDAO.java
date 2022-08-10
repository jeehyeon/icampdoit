package com.exam.search;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Repository
public class SearchkeyDAO {
	
	public List<SearchkeyTO> searchkeyDAO(String keysearch) {
	      // TODO Auto-generated method stub
		
		  ArrayList<SearchkeyTO> datas = new ArrayList<SearchkeyTO>();
		
	      try {
	         DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();      
	         DocumentBuilder builder = factory.newDocumentBuilder();

	         String keyword = URLEncoder.encode( keysearch, "utf-8" );
			 System.out.println( "keyword : " + keyword );
	         
	         Document document = builder.parse( new URL("https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList?ServiceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&keyword=" +keyword).openStream());
	         
	         Element root = document.getDocumentElement();
	         System.out.println( root.toString() );	// [response: null] 출력됨
	         
	         NodeList nodes = document.getElementsByTagName("item");
	         
	         for ( int i = 0; i < nodes.getLength(); i++ ) {
	            Node node = nodes.item(i);
	            
	            if ( node.getNodeType() == Node.ELEMENT_NODE ) { // node객체가 앨리먼트인것만 화면에 출력
	               Element element = (Element) node;	
	               
	               SearchkeyTO kto = new SearchkeyTO();
	               
	               try {
	            	   kto.setFacltNm(getValue( "facltNm", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setFacltNm("");
					}
	               
	               try {
	            	   kto.setAddr1(getValue( "addr1", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setAddr1("");
					}
	               
	               try {
	            	   kto.setAddr1(getValue( "addr2", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setAddr2("");
					}
	               
	               try {
	            	   kto.setInduty(getValue( "induty", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setInduty("");
					}
	               
	               try {
	            	   kto.setFirstImageUrl(getValue( "firstImageUrl", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setFirstImageUrl("./resources/bootstrap-5/html/img/noimage.jpg");
					}
	                       
	               try {
	            	   kto.setContentId(getValue( "contentId", element ));
					} catch (java.lang.NullPointerException e1) {
						// TODO Auto-generated catch block
						kto.setContentId("");
					}
 
	               try {		
						kto.setIntro(getValue( "intro", element ));
					} catch (java.lang.NullPointerException e) {
						// TODO Auto-generated catch block
						kto.setIntro("");
					}
	               	               
	               datas.add(kto);
	            }
	         }
	         
	      } catch (MalformedURLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
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
	      
	      return datas;
	   }

	   private static String getValue(String tag, Element element) {
		   NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
		   Node node = (Node)nodes.item(0);
		   return node.getNodeValue();
	   }
	
}