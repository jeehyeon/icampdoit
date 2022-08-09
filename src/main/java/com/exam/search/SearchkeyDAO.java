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

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;

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
	         //System.out.println( "1" );
	         
	         for ( int i = 0; i < nodes.getLength(); i++ ) {
	            Node node = nodes.item(i);
	            //System.out.println( "2" );
	            
	            if ( node.getNodeType() == Node.ELEMENT_NODE ) { // node객체가 앨리먼트인것만 화면에 출력
	               Element element = (Element) node;	               
	               //System.out.println( "3" );
	               
	               SearchkeyTO kto = new SearchkeyTO();
	               kto.setFacltNm(getValue( "facltNm", element ));
	               kto.setAddr1(getValue( "addr1", element ));
	               kto.setInduty(getValue( "induty", element ));
	               kto.setFirstImageUrl(getValue( "firstImageUrl", element ));
	               
	               
	               kto.setContentId(getValue( "contentId", element ));
	               /*
	               kto.setIntro(getValue( "intro", element ));
	               kto.setAnimalCmgCl(getValue( "animalCmgCl", element ));
	               kto.setTrlerAcmpnyAt(getValue( "trlerAcmpnyAt", element ));
	               kto.setCaravAcmpnyAt(getValue( "caravAcmpnyAt", element ));
	               kto.setLctCl(getValue( "lctCl", element ));
	               kto.setBrazierCl(getValue( "brazierCl", element ));
	               kto.setSiteBottomCl1(getValue( "siteBottomCl1", element ));
	               kto.setSiteBottomCl2(getValue( "siteBottomCl2", element ));
	               kto.setSiteBottomCl3(getValue( "siteBottomCl3", element ));
	               kto.setSiteBottomCl4(getValue( "siteBottomCl4", element ));
	               kto.setSiteBottomCl5(getValue( "siteBottomCl5", element ));
	               kto.setSbrsCl(getValue( "sbrsCl", element ));
	               */
	               
	               //System.out.println( "4" );
	               
	               //System.out.println("캠핑장명 : " + getValue( "facltNm", element ));	
	               //System.out.println("캠핑장 유형 : " + getValue( "induty", element ));
	               //System.out.println("캠핑장 주소 : " + getValue( "addr1", element ));
	               //System.out.println("캠핑장 대표사진 : " + getValue( "firstImageUrl", element ));
	               
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
