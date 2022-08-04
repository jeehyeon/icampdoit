<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type='text/javascript'>
Kakao.init('2dde53cc9d654a3a8d8b78783aa5cbfc');
Kakao.isInitialized();
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return;
    }
    Kakao.Auth.setAccessToken(undefined);
};
   
kakaoLogout();
alert(Kakao.Auth.getAccessToken());
alert( '로그아웃 되었습니다.' );
location.href='home.do';
	
</script>
