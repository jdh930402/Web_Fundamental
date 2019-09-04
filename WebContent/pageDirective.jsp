<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>

<!-- 응답 MIME타입과 문자 인코딩을 지정한다. -->
<%@page contentType="text/html; charset=utf-8" %>

<!-- 문자 인코딩을 지정한다 -->
<%@ page pageEncoding = "utf-8"%>

<!-- HttpSession객체 사용여부를 결정한다. -->
<%@ page session = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP page directive Demo</title>
<script>
let station = '강남역';
let ourName = `이번 정차역은 ${station}입니다.`;
console.log(ourName);
</script>
</head>
<body>
<h1>Page Directive1111</h1>
<%
HttpSession ses = null;
ArrayList list = new ArrayList();
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
request.setAttribute("name", "sung");
String id = request.getParameter("id");
if(id == null){
	id = "";
}
%>

당신의 이름 : ${param.id}, <%=id %>

</body>
</html>