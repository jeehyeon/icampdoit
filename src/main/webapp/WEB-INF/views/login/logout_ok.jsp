<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String prevPage = (String)request.getAttribute("prevPage");
%>
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
		
		Swal.fire({
				title: '로그아웃 되었습니다.',  
				text:	'',
				icon:	'success',
				confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				
		}).then((result) => {
			
  			 if (result.isConfirmed) {
  				location.href= '<%=prevPage%>';
  			 } 
  		})
 				
			
		
	
</script>
</body>
</html>