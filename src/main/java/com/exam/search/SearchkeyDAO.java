package com.exam.search;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	private String getValue(String tag, Element element) {
		// TODO Auto-generated method stub
		if(element.getElementsByTagName(tag).item(0)== null) {
			return " ";
		}
		NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
		Node node =(Node) nodes.item(0);
		
		return node.getNodeValue();
	}
	
	public List<SearchkeyTO> searchkeyDAO(String keysearch) {
		
		try {
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			
			String str = "카라반";
			//String str = request.getParameter( "keysearch" );
			System.out.println( "keysearch : " + str );
			
			String keyword = URLEncoder.encode(str, "utf-8");
			System.out.println( "keyword : " + keyword);
			
			String url = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"
					+ "?ServiceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D"
					+ "&numOfRows=3107"
					+ "&pageNo=1"
					+ "&MobileOS=ETC"
					+ "&MobileApp=TestApp"
					+ "&keyword=" + keyword;
			
			System.out.println( "url : " + url );
						
			Document document = builder.parse( url );
			
			NodeList nodes = document.getElementsByTagName( "item" );
			for( int i=0 ; i<nodes.getLength() ; i++ ) {
				Node node = nodes.item( i );
				
				if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    System.out.println("캠핑장명 :" + getValue("facltNm", element));				
					System.out.println("캠핑장 주소 :" + getValue("addr1", element)+" "+ getValue("addr2", element));
					System.out.println("캠핑장 유형 :" + getValue("induty", element));
				}
			}
			
			
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

		return null;
	}
	
}
