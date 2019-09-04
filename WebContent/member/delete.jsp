<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	MemberDao dao = MemberDao.getInstance();
	if(dao.delete(seq)){
%>	
	<script> 
		alert('삭제 성공');
		location.href = 'list.jsp?page=<%=cPage%>';
	</script>
<%
	} else{
%>
	<script>
		alert('삭제 실패');
		history.back(-1);
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>