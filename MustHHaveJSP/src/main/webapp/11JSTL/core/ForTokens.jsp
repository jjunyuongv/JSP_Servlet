<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JSTL - forTokens</title>
	</head>
	<body>
		<%
		String rgba = "Red,Green,Blue,Black";
		%>
		<h4>JSTL의 forTokens 태그 사용</h4>
		<c:forTokens items="<%= rgba %>" delims="," var="color">
			<span style="color:${ color };">${ color }</span> <br />
		</c:forTokens>
		
		<h4>StringTokenizer 클래스 사용</h4>
		<%
		StringTokenizer tokens = new StringTokenizer(rgba, ",");
		out.println("토큰수 :" + tokens.countTokens() + "<br/>");
		while(tokens.hasMoreTokens())
		{
			String token = tokens.nextToken();
			out.println(token + "<br/>");
		}
		%>
		
		<h4>String 클래스의 split() 메소드 사용</h4>
		<%
		String[] colorArr = rgba.split(",");
		for (String s : colorArr)
		{
			out.println(s + "<br/>");			
		}
		%>
	</body>
</html>