<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 받는 값을 utf-8로 인코딩해준다.
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = new NoticeDto(writer, title, content);
	if(dao.insert(dto)){
	%>
	<script>
		alert('성공');
		location.href="list.jsp?num ";
	</script>
	<%} else{ %>
	<script>
		alert('실패');
		history.back(-1); // 이전 페이지로 되돌아가기
	</script>
	<%} %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>