package com.exam.insertDB;

import java.io.IOException;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public GocampingTO gocampingparse(GocampingTO gto) {
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document document = dBuilder.parse( new URL("https://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp").openStream());
			
			 Element root = document.getDocumentElement();
	         System.out.println( root.toString() );	// [response: null] 출력됨
	         
	         NodeList nList = document.getElementsByTagName("item");
	         //System.out.println( "1" );
			
			
			for(int i = 0; i < nList.getLength(); i++){		
				//System.out.println(nList.item(i).getAttributes().getNamedItem("facltNm").getNodeValue());
				Node node = nList.item(i);
				
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					if((getValue("doNm", element) != " ")){
						if((getValue("doNm", element).toString().indexOf("강원도") ) != -1) {
							try {
								System.out.println("캠핑장명:" + getValue("facltNm", element));
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println("캠핑장명: 없음");
							}
							
							try {
								System.out.println("주소:" + getValue("addr1", element));
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println("주소: 없음" );
							}
							
							try {
								System.out.println("캠핑장 유형 :" + getValue("induty", element));
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println("캠핑장 유형 : 없음");
							}
							try {
								System.out.println("캠핑장 유형 :" + getValue("sbrsCl", element));
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println("캠핑장 유형 : 없음");
							}
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
		
		
		return gto;
	};
}
