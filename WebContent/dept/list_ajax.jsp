<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@page pageEncoding="utf-8"%>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == "0" || tempPage == null || tempPage.length() == 0){
		tempPage = "1";				
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	DeptDao dao = DeptDao.getInstance();
	int tableLength = 5;
	int length = 10;
	int start =  (cPage-1)*length;
	int totalRows = dao.getCount();
	int totalPage = totalRows%tableLength==0 ? totalRows/tableLength : totalRows/tableLength+1;	
	int currentBlock = (cPage-1)/tableLength;
 	int totalBlock = totalPage/tableLength;
	int startPage = (currentBlock*tableLength)+1; 
	int endPage = (currentBlock+1)*tableLength;
	if(totalBlock == currentBlock){
		endPage = totalPage;
	}
	ArrayList<DeptDto> list = dao.select(start, length);
%>

<table class="table table-hover">
	<colgroup>
		<col width="15%" />
		<col width="15%" />
		<col width="35%" />
		<col width="35%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">부서번호</th>
			<th scope="col">부서명</th>
			<th scope="col">부서위치</th>
		</tr>
	</thead>
	<tbody>
		<tr>		
		
		
<%
	if(list.size() != 0){
		for(int i=0; i<list.size() ; i++){
			DeptDto dto = list.get(i);
			int no = dto.getNo();
			String name = dto.getName();
			String loc = dto.getLoc();
%>
			<th scope="row"><%=list.size()-i%></th>
			<td><%=no%></td>
			<td><a class = "click_list" href = "view.jsp?no=<%=no%>"><%=name%></a></td>
			<td><%=loc%></td>
		</tr>	
		
<% 
		}
	} else {	
%>
<tr>
	<td class = "text-center" colspan = "6" scope = "row"> 등록된 부서가 없습니다.</td>
</tr>
<%
	}
%>	
	</tbody>
</table>

<nav aria-label="Page navigation example">
	<ul class="pagination pagination-lg justify-content-center">
		<%-- <<버튼 --%>
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1">&laquo;</a>
		</li>
		
		<% 
		
		for(int i = startPage ; i <= endPage ; i++){
		%>
		<li class="page-item"><a class="page-link" href="#"><%=i%></a></li>
		<%}%>
		<%-- >>버튼 --%>
		<li class="page-item">
			<a class="page-link" href="#">&raquo;</a>
		</li>
	</ul>
</nav>
