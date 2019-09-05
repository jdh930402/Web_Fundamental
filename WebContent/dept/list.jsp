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

<script>
	const util = {
			
			
	}
	
	$(window).
	
</script>