<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>

<%
	String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length() == 0 || tempPage.equals("0")){
		tempPage = "1";
	}
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
		if(cPage < 0){
			cPage = Math.abs(cPage);
		}
	} catch(NumberFormatException e){
		cPage = 1;
	}
	
	int length = 20;
	int start =  (cPage-1)*length;
	DeptDao dao = DeptDao.getInstance();
	ArrayList<DeptDto> list = dao.select(start, length);
%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Department</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">부서목록</h5>
						<div class="table-responsive-md">
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
									<tr >		
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
									</script>
									<% 
											}
										}else{	
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
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">6</a></li>
									<li class="page-item"><a class="page-link" href="#">7</a></li>
									<li class="page-item"><a class="page-link" href="#">8</a></li>
									<li class="page-item"><a class="page-link" href="#">9</a></li>
									<li class="page-item"><a class="page-link" href="#">10</a></li>
									<li class="page-item">
										<a class="page-link" href="#">&raquo;</a>
									</li>
								</ul>
							</nav>

							<div class="text-right">
								<a href="/dept/write.jsp" class="btn btn-outline-primary">부서등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "/inc/footer.jsp"%>