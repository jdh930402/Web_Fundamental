<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	no = dto.getNo();
	String name = dto.getName();
	String loc = dto.getLoc();
	
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
						<h5 class="card-title">부서 상세정보</h5>

						<form class="form-horizontal" role="form" name = "f" method = "post" action = "modify.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="no">부서번호</label>
								<div class="col-sm-10">
										<p> <%=no%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서명</label>
								<div class="col-sm-10">
										<p> <%=name%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">부서위치</label>
								<div class="col-sm-10">
									<p> <%=loc%></p>
								</div>
							</div>
						</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=no%>" class="btn btn-outline-success">리스트</a>
			</div>

					</div>
				</div>
			</div>

		</div>
	</div>
<%@ include file = "/inc/footer.jsp"%>