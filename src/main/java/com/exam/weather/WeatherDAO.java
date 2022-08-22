package com.exam.weather;

import java.io.IOException;


import java.util.Calendar;
import java.util.HashMap;

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
public class WeatherDAO {
	
	
	
	
	
	
	
	public WeatherTO weathearDAO() {
		
		long start = System.currentTimeMillis();
		WeatherTO wto = new WeatherTO();
		int page =1;
		HashMap<String, String> minList = new HashMap<String, String>();
		HashMap<String, String> maxList = new HashMap<String, String>();
		HashMap<String, String> popList = new HashMap<String, String>();
		HashMap<String, String> skyList = new HashMap<String, String>();
		System.out.println("오늘 날짜 :" +wto.getDate0());
		try {
	
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
				+ "?serviceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D"
				+ "&numOfRows=900"
				+ "&pageNo=1"
				+ "&base_date=" + wto.getDate0()
				+ "&base_time=2300"
				+ "&nx=60"
				+ "&ny=126";
		System.out.println(url);
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			//NodeList totalList = doc.getElementsByTagName("body");
			//Element total = (Element) totalList.item(totalList.getLength()-1); 
			//int toatalCount = Integer.parseInt( wg.weatherGet("totalCount", total));
			//System.out.println("총 갯수" + wg.weatherGet("totalCount", total));
			//System.out.println();
			//System.out.println("root node : " + doc.getDocumentElement());
			NodeList nList = doc.getElementsByTagName("item");
			
			System.out.println("파싱할 리스트  수 : "+ nList.getLength());
			int tidx = nList.getLength()/6;
			
			
			ShortWeatherThread th1 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, 0, tidx);
			ShortWeatherThread th2 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, tidx+1, tidx*2);
			ShortWeatherThread th3 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, tidx*2+1, tidx*3);
			ShortWeatherThread th4 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, tidx*3+1, tidx*4);
			ShortWeatherThread th5 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, tidx*4+1, tidx*5);
			ShortWeatherThread th6 = new ShortWeatherThread(nList, minList, maxList, popList, skyList, tidx*5+1, nList.getLength());
			
			th1.setPriority(10);
			th2.setPriority(9);
			th3.setPriority(8);
			th4.setPriority(7);
			th5.setPriority(6);
			th6.setPriority(5);
			
			th1.start();
			th2.start();
			th3.start();
			th4.start();
			th5.start();
			th6.start();

			try {
				th1.join();
				th2.join();
				th3.join();
				th4.join();
				th5.join();
				th6.join();
				System.out.println(minList);
				System.out.println(maxList);
				System.out.println(popList);
				System.out.println(skyList);
				
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				System.err.println(" [쓰레드 에러] "+e.getMessage());
			}
			//page+=1;
		//	System.out.println("페이지 갯수" + page);
			//if(page==3){break;};
	
			
			
			wto.setTaMin1(minList.get(wto.getDate1()).toString());
			wto.setTaMin2(minList.get(wto.getDate2()).toString());
			wto.setTaMin3(minList.get(wto.getDate3()).toString());
			
			wto.setTaMax1(maxList.get(wto.getDate1()).toString());
			wto.setTaMax2(maxList.get(wto.getDate2()).toString());
			wto.setTaMax3(maxList.get(wto.getDate3()).toString());
					
			wto.setPop1(popList.get(wto.getDate1()).toString());
			wto.setPop2(popList.get(wto.getDate2()).toString());
			wto.setPop3(popList.get(wto.getDate3()).toString());
			
			
			wto.setSky1(skyList.get(wto.getDate1()).toString());
			wto.setSky2(skyList.get(wto.getDate2()).toString());
			wto.setSky3(skyList.get(wto.getDate3()).toString());
			
			
			
		
			
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
	
		long end = System.currentTimeMillis();
		System.out.println("단기수행시간: " + (end - start) + " ms");
	return wto;
		
	}
	
	
	
	public WeatherTO weathearDAO2() {
		long start = System.currentTimeMillis();
		WeatherTO wto = new WeatherTO();
		Calendar cal = Calendar.getInstance();
	      String dnt;
	      int flag=2;
	      if(cal.get(Calendar.HOUR_OF_DAY) < 7) {
	    	   dnt= wto.getDate0() + "1800";
	    	  flag=0;
	      }else {
	    	   dnt= wto.getDate1() + "0600";
	    	   flag=1;
	      }
		System.out.println(dnt);
		
	  try {
		String url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"
				+ "?serviceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D"
				+ "&numOfRows=10"
				+ "&pageNo=1"
				+ "&regId=11B10101"
				+ "&tmFc="+dnt;
		
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			
			
				Node node = nList.item(0);
				
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					WeatherGet wg = new WeatherGet();
						
					if(flag == 0) {
						wto.setTaMin4(wg.weatherGet("taMin4", element));
						wto.setTaMax4(wg.weatherGet("taMax4", element));
						
						wto.setTaMin5(wg.weatherGet("taMin5", element));
						wto.setTaMax5(wg.weatherGet("taMax5", element));
						
						wto.setTaMin6(wg.weatherGet("taMin6", element));
						wto.setTaMax6(wg.weatherGet("taMax6", element));
						
						wto.setTaMin7(wg.weatherGet("taMin7", element));
						wto.setTaMax7(wg.weatherGet("taMax7", element));
					
					}else if(flag ==1 ) {
						wto.setTaMin4(wg.weatherGet("taMin3", element));
						wto.setTaMax4(wg.weatherGet("taMax3", element));
						
						wto.setTaMin5(wg.weatherGet("taMin4", element));
						wto.setTaMax5(wg.weatherGet("taMax4", element));
						
						wto.setTaMin6(wg.weatherGet("taMin5", element));
						wto.setTaMax6(wg.weatherGet("taMax5", element));
						
						wto.setTaMin7(wg.weatherGet("taMin6", element));
						wto.setTaMax7(wg.weatherGet("taMax6", element));
						
					}
						
					
				};
				

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
	  
	  	long end = System.currentTimeMillis();
		System.out.println("중기1 수행시간: " + (end - start) + " ms");
		return wto;
			
		}
	
	
	
	public WeatherTO weathearDAO3() {
		long start = System.currentTimeMillis();
		WeatherTO wto = new WeatherTO();
		Calendar cal = Calendar.getInstance();
	      String dnt;
	      int flag=2;
	      if(cal.get(Calendar.HOUR_OF_DAY) < 7) {
	    	   dnt= wto.getDate0() + "1800";
	    	  flag=0;
	      }else {
	    	   dnt= wto.getDate1() + "0600";
	    	   flag=1;
	      }
		System.out.println(dnt);
		
	  try {
		String url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"
				+ "?serviceKey=74rd5r1MwtY%2F3dFG0s9I1UDtFBJBj1zjmm0VdZBNsJoslwPnviVh2PeV1vCg%2BtaHuMvN8G1f1PWIwKh3I%2BI0oQ%3D%3D"
				+ "&numOfRows=10"
				+ "&pageNo=1"
				+ "&regId=11B00000"
				+ "&tmFc="+dnt;
		
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			
			
				Node node = nList.item(0);
				
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					WeatherGet wg = new WeatherGet();
						
					if(flag == 0) {
						wto.setPop4(wg.weatherGet("rnSt4Pm", element));
						wto.setSky4(wg.weatherGet("wf4Pm", element));
						//System.out.println(wg.weatherGet("rnSt4Pm", element));
						wto.setPop5(wg.weatherGet("rnSt5Pm", element));
						wto.setSky5(wg.weatherGet("wf5Pm", element));
						
						wto.setPop6(wg.weatherGet("rnSt6Pm", element));
						wto.setSky6(wg.weatherGet("wf6Pm", element));
						
						wto.setPop7(wg.weatherGet("rnSt7Pm", element));
						wto.setSky7(wg.weatherGet("wf7Pm", element));
					
					}else if(flag ==1 ) {
						wto.setPop4(wg.weatherGet("rnSt3Pm", element));
						wto.setSky4(wg.weatherGet("wf3Pm", element));
						
						wto.setPop5(wg.weatherGet("rnSt4Pm", element));
						wto.setSky5(wg.weatherGet("wf4Pm", element));
						//System.out.println(wg.weatherGet("rnSt4Pm", element));
						wto.setPop6(wg.weatherGet("rnSt5Pm", element));
						wto.setSky6(wg.weatherGet("wf5Pm", element));
						//System.out.println("하늘 6일 : " +  wto.getSky6());
						wto.setPop7(wg.weatherGet("rnSt6Pm", element));
						wto.setSky7(wg.weatherGet("wf6Pm", element));
						
					}
						
					
				};
				

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
	  
	  	long end = System.currentTimeMillis();
		System.out.println("중기2수행시간: " + (end - start) + " ms");
		return wto;
			
		}
	
	
	
}
