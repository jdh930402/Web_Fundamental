<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	// get방식으로 받은 page를 판별
	String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length()==0 || tempPage.equals("0")){
		tempPage = "1";
	}
	
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
		if(cPage < 0){
			cPage = Math.abs(cPage);
			System.out.println(cPage);
		}
	} catch(NumberFormatException e){
		cPage = 1;
	}
	EmpDao dao = EmpDao.getInstance(); 	
	int length = 10;
	int start = (cPage-1)*length;
	int totalRows = dao.getRows();
	int totalPage =  0;
	int startPage = 0;
	int endPage = 0;
	ArrayList<EmpDto> list = dao.select(start, length);
	
	totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length+1;
	if(totalPage == 0){
		totalPage = 1;
	}
										
												
	int currentBlock = cPage%length == 0 ? cPage/length : cPage/length+1;  
	int totalBlock = totalPage%length == 0? totalPage/length : totalPage/length+1;
														
	startPage = (currentBlock - 1) * length + 1;
	endPage = currentBlock * 10;
										
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Employee</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">사원목록</h5>
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="20%" />
									<col width="20%" />
									<col width="15%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">사원번호</th>
										<th scope="col">이름</th>
										<th scope="col">직책</th>
										<th scope="col">담당사수</th>
										<th scope="col">입사일</th>				
									</tr>
								</thead>
								<tbody>
									<%
									if(list.size() != 0){ 
									for(int i=0 ; i<list.size() ; i++){
										EmpDto dto = list.get(i);
										int index = totalRows-(cPage-1)*length-i;
										int no = dto.getNo();
										String name = dto.getName();
										String job = dto.getJob();
										int mgr = dto.getMgr();
										String hiredate = dto.getHireDate();
									%>
									
									<tr>
										<th scope="row"><%=index%></th>
										<td><%=no%></td>
										<td ><a class = "click_list" href = "view.jsp?no=<%=no%>&page=<%=cPage%>"><%=name%></a></td>
										<td><%=job%></td>
										<td><%=mgr%></td>
										<td><%=hiredate%></td>
									</tr>
									<%}} else{ %>
									 <tr>
									 	<td class = "text-center" colspan = "6" scope = "row"> 등록된 사원이 없습니다.</td>
									 </tr>										
									<%} %>
								</tbody>								
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
								
								<% if(cPage==1){ %>
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
								<%}else{%>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=cPage-1%>" tabindex="-1">&laquo;</a>
									</li>
								<%}%>
									
									<%
										
										
										
										for(int i = startPage ; i <= endPage ; i++ ){
									%>
									<li class="page-item"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i%></a></li>
									<%
										}
									%>
									
									<% if(cPage==endPage){ %>
									<li class="page-item disabled">
										<a class="page-link" href="#">&raquo;</a>
									</li>
									<%}else{%>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=cPage+1%>" tabindex="-1">&raquo;</a>
									</li>
								<%}%>
									
								</ul>
							</nav>

							<div class="text-right">
								<a href="write.jsp?page=<%=cPage%>" class="btn btn-outline-primary">사원등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "/inc/footer.jsp" %>