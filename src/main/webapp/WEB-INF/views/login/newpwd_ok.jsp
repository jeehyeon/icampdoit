<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
int flag = (Integer)request.getAttribute("flag");
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '비밀번호 변경 성공.' );" );
		out.println( "location.href='login.do';" );
	}else if(flag ==2){
		out.println( "alert( '실패 : 최근에 변경한 비밀번호와 같습니다.' );" );
		out.println( "history.back();" );
	}else {
		out.println( "alert( '비밀번호 변경 실패.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I CAMP DO IT</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- Favicon-->
<link rel="shortcut icon" href="./resources/bootstrap-5/html/img/logo2.svg">
</head>
<body>
 	<!-- Sweet Alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script type='text/javascript'>
		
		   var flag = <%=(Integer)request.getAttribute("flag")%>;
		   
		   const Toast = Swal.mixin({
			    toast: true,
			    position: 'center-center',
			    showConfirmButton: false,
			    timer: 3000,
			    timerProgressBar: false,
			    didOpen: (toast) => {
			        toast.addEventListener('mouseenter', Swal.stopTimer)
			        toast.addEventListener('mouseleave', Swal.resumeTimer)
			    }
			})
			
			if( flag == 0 ) {
				Swal.fire({
					title: '비밀번호 변경 성공',  
					text:	'다시 로그인해 주세요.',
					icon:	'success',
					confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					
			}).then((result) => {
				
	  			 if (result.isConfirmed) {
	  				 location.href='/login.do';
	  			 } 
	  		})
	  		
			} else if( flag == 2 ) {
				Swal.fire({
					title: '비밀번호 변경 실패',  
					text:	'최근에 변경한 비밀번호와 같습니다.',
					icon:	'warning',
					confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					
			}).then((result) => {
				
				if (result.isConfirmed) {
	  				history.back();
	  			} 
	  		}) 
	 				
			} else {
				Swal.fire({
					title: '비밀번호 변경 실패',     
					text:	'', 
					icon:	'error',
					confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					
			}).then((result) => {
				
	  			 if (result.isConfirmed) {
	  				history.back();
	  			 } 
	  		})
				
			}
				 	
</script>
</body>
</html>