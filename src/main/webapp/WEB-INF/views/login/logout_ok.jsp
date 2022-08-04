<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String kakaoLogout = "function kakaoLogout('2dde53cc9d654a3a8d8b78783aa5cbfc'){Kakao.init(kakaoKey);";
			kakaoLogout +="Kakao.isInitialized();";
			kakaoLogout +="if(!Kakao.Auth.getAccessToken()){";
			kakaoLogout +="alert('Not logged in')";
			kakaoLogout +="return;}";
			kakaoLogout +="Kakao.Auth.logout(function(){";
			kakaoLogout +="alert(kakao logout)";
			kakaoLogout +="});";
			kakaoLogout +="};";
			

	out.println("<script src=\"https://developers.kakao.com/sdk/js/kakao.js\"></script>");
	out.println( "<script type='text/javascript'>" );
	out.println( "alert( '로그아웃 되었습니다.' );" );
	out.println( "location.href='home.do';" );
	out.println( "</script>" );
%>