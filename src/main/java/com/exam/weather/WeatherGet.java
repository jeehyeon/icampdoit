package com.exam.weather;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class WeatherGet {
	public String weatherGet(String tag, Element element) {
	
		if(element.getElementsByTagName(tag).item(0)== null) {
			return " ";
		}
		NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
		Node node =(Node) nodes.item(0);
		
		return node.getNodeValue();
	}
}
