<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 받는 값을 utf-8로 인코딩해준다.	
	int cPage = Integer.parseInt(request.getParameter("page"));
	int no = Integer.parseInt(request.getParameter("no"));
	EmpDao dao = EmpDao.getInstance();
	if(dao.delete(no)){
	%>
	<script>
		alert('성공');
		location.href="list.jsp?page=<%=cPage%>";
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