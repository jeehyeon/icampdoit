<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

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
			
			if( flag != 1){
			//세션 등록
				Swal.fire({
					title: '게시글을 삭제하였습니다.',     
					text:	' ', 
					icon:	'success',
					confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					
			}).then((result) => {
				
	  			 if (result.isConfirmed) {
	  				 location.href='/mboardlist.do';
	  			 } 
	  			 })
	 				
			} else {
				Toast.fire({
				    icon: 'warning',
				    title: '게시글 삭제 실패'
				})
				history.back();
			}
			
	 	
	</script>
</body>
</html>
