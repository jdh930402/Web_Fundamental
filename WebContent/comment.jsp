<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jsp Comment Demo</title>
</head>
<body>
<!-- http 주석입니다  -->
<%-- jsp 주석입니다 --%>
<h1> jsp Comment</h1>
<!--  <input type="text" name = "name" value="<%="abc"%>"> -->
<%-- <input type="text" name = "name2" value="abc" > --%>
</body>
<ul>
<%
for(int i=0 ; i<100 ; i++)
	out.println("<li>" + i +"</li>");
%>
</ul>
</html>