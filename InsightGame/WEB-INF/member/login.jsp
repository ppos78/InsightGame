<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">


<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">

<!-- Twitch login logo -->
<script src="https://ttv-api.s3.amazonaws.com/twitch.min.js"></script>

</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div style="margin-top: 15%; text-align: center;">
			<div style="display: inline-block; margin-top: 3.5%;">
				<div style="height: 500px; width: 500px; border:3px solid #2c3e50; margin: 0 auto; padding-top: 20px; border-radius: 8px;">
				<span style="font-size: 1.5rem; color: #2c3e50; font-weight: bold;">Insight Game 로그인</span><br>
				<a href="${naverurl}">
				<img src="${pageContext.request.contextPath}/img/login_naver.png" style="margin-top: 55px; padding-bottom: 10px; width: 343px;"/></a><br>
				<a href="${twitchurl}">
				<img src="${pageContext.request.contextPath}/img/login_twitch.png" style="padding-bottom: 20.5px; width: 344px;"/></a><br>
				<a href="${googleurl}">
				<img src="${pageContext.request.contextPath}/img/login_google.png" style="width: 321px;" /></a><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>