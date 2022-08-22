package com.exam.weather;

import java.util.HashMap;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ShortWeatherThread extends Thread {
	private NodeList nList;
	private	HashMap<String, String> minList;
	private HashMap<String, String> maxList;
	private HashMap<String, String> popList;
	private HashMap<String, String> skyList;
	private int startidx;
	private int endidx;
	WeatherGet wg = new WeatherGet();
	
	public ShortWeatherThread(NodeList nList, HashMap<String, String> minList, 
							HashMap<String, String> maxList,
							HashMap<String, String> popList,
							HashMap<String, String> skyList,
							int startidx, int endidx) {
		// TODO Auto-generated constructor stub
		this.nList= nList;
		this.minList= minList;
		this.maxList= maxList;
		this.popList= popList;
		this.skyList= skyList;
		this.startidx = startidx;
		this.endidx = endidx;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i = startidx; i < endidx; i++){		
			Node node = nList.item(i);
			
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;
				
				// 최저기온
				if(wg.weatherGet("category", element).indexOf("TMN") != -1) {
					minList.put(wg.weatherGet("fcstDate", element), wg.weatherGet("fcstValue", element));
				}
				// 최고기온
				if(wg.weatherGet("category", element).indexOf("TMX") != -1) {
					maxList.put(wg.weatherGet("fcstDate", element), wg.weatherGet("fcstValue", element));
				}
				// 강수량
				if((wg.weatherGet("category", element).indexOf("POP") != -1)&&(wg.weatherGet("fcstTime", element).indexOf("1200") != -1)) {
					popList.put(wg.weatherGet("fcstDate", element), wg.weatherGet("fcstValue", element));
				}
				// 하늘 흐림정도
				if((wg.weatherGet("category", element).indexOf("SKY") != -1)&&(wg.weatherGet("fcstTime", element).indexOf("1200") != -1)) {
					skyList.put(wg.weatherGet("fcstDate", element), wg.weatherGet("fcstValue", element));
				}
			}
		};
	}
	
	
}
