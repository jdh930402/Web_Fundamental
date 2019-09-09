<%@ page pageEncoding="UTF-8"%>
<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@include file="/inc/header.jsp" %>

<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.equals("0")){
		tempPage = "1";
	}
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
	
	String tempNum = request.getParameter("no");
	int no = 0;
	try{
	no = Integer.parseInt(tempNum);
	} catch(NumberFormatException e){
		no=0;
	}
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(no);
	
	if( dto != null){
		no = dto.getNo();
		String name = dto.getName();
		String job = dto.getJob();
		int mgr = dto.getMgr();
		String hiredate = dto.getHireDate();
		float sal = dto.getSal();
		float comm = dto.getComm();
		int deptno = dto.getDeptno();
		new EmpDto(no, name, job, mgr, hiredate, sal, comm, deptno);
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
						<h5 class="card-title">사원 상세정보</h5>

						<!-- form의 액션은 form하나에 하나만 지정가능, 여러곳에 지정하려면 script를 이용한다. -->
						<form class="form-horizontal" role="form" method = "post" name = "f" action ="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="no">사원번호</label>
								<div class="col-sm-10">
									<p><%=no%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">이름</label>
								<div class="col-sm-10">
									<p><%=name%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<p><%=job%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">담당사수</label>
								<div class="col-sm-10">
									<p><%=mgr%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">입사일</label>
								<div class="col-sm-10">
									<p><%=hiredate%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">급여</label>
								<div class="col-sm-10">
									<p><%=sal%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">커미션</label>
								<div class="col-sm-10">
									<p><%=comm%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									<p><%=deptno%></p>
								</div>
							</div>
							
							<input type="hidden" name = "no" value = "<%=no%>" > 
						</form>

						<div class="text-right">
								<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-success">리스트</a>
						</div>
						
						<script>
						$(function(){
							$('#modifyEmp').on('click',function(event){
								event.preventDefault(); // 원래의 하이퍼링크 기능을 없애는 소스
								//유효성 검사
								f.action = "modify.jsp?page=<%=cPage%>";
								f.submit();
							});
							
							$('#deleteEmp').on('click',function(event){
								event.preventDefault(); // 원래의 하이퍼링크 기능을 없애는 소스								
								//유효성 검사 필요 없음.
								f.action = "delete.jsp?page=<%=cPage%>";
								f.submit();
							});
						});
						
						
						</script>

					</div>
				</div>
			</div>

		</div>
	</div>
<%@include file="/inc/footer.jsp"%>
<%} else{%>

<script>
	alert('돌아가시오');
	history.back(-1);
</script>
<%}%>