<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JSTL - import</title>
	</head>
	<body>
		<c:set var="requestVar" value="MustHave" scope="request" />
		<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
			<c:param name="user_param1" value="JSP" />
			<c:param name="user_param2" value="기본서" />
		</c:import>
		
		<h4>다른 문서 삽입하기</h4>
		${ contents }
		
		<div>
			<h4>이미지 삽입하기</h4>
			<h5>상대경로 지정</h5>
			<img src="../../images/Error.jpg" width="150" height="80" />
			<h5>절대경로 지정</h5>
			<img src="/MustHHaveJSP/images/Error.jpg" width="150" height="80" />
			<h5>절대경로 지정(request 내장객체 사용)</h5>
			<img src="<%= request.getContextPath() %>/images/Error.jpg" width="150" height="80" />
		</div>
		
		<h4>외부 자원 삽입하기</h4>
		<iframe src="../inc/GoldPage.jsp" style="width:100%; height:600px;"></iframe>
		
	</body>
</html>