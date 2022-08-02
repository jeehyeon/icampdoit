<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login</title>
</head>
<body>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('2dde53cc9d654a3a8d8b78783aa5cbfc');
		
		console.log( Kakao.isInitialized() );
		
		/*
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope: 'profile_nickname, accont_email, gender, age_range',
				success: function(authObj){
					console.log( authObj );
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.login( kakao_account );
						}
					});
				}
			});
		}
		*/
	</script>
</body>
</html>