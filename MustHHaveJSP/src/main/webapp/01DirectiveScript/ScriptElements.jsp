<%@page import="common.Myclass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int add(int num1, int num2) {
	return num1 + num2;
}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>스크립트 요소</title>
	</head>
	<body>
		<%
		int result = add(10, 20);
		%>
		덧셈 결과 1 : <%= result  %> <br />
		덧셈 결과 2 : <%= add(30, 40)  %>
		
		
		<h2>내가 만든 JAVA 클래스의 메소드 호출하기</h2>
		<%
		int sum = Myclass.myFunc(1, 26);
		out.println("1~26까지");
		%>
	</body>
</html>