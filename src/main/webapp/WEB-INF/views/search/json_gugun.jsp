<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="com.exam.search.SearchmapDAO" %>
<%@ page import="com.exam.search.SearchkeyTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	SearchmapDAO dao = new SearchmapDAO();
	ArrayList<SearchkeyTO> lists = dao.listsigunguNm( request.getParameter( "sido" ) );
	
	JSONArray jsonArray = new JSONArray();
	for( SearchkeyTO to : lists ){
		String sigunguNm = to.getSigunguNm();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put( "sigunguNm", sigunguNm );
		
		jsonArray.add( jsonObject );
	}
	
	//request.setAttribute( "jsonArray", jsonArray );
%>