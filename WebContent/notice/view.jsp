<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNum = request.getParameter("num");
	int num = 0;
	try{
	num = Integer.parseInt(tempNum);
	} catch(NumberFormatException e){
		num=0;
	}
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(num);
	Utility util = new Utility();
	if( dto != null){
		String writer = dto.getWriter();
		String title = dto.getTitle();
		String content = dto.getContent();
		String regDate = dto.getRegdate();
%>
<%@include file="/inc/header.jsp" %>


	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Notice</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">공지사항</h5>

						<!-- form의 액션은 form하나에 하나만 지정가능, 여러곳에 지정하려면 script를 이용한다. -->
						<form class="form-horizontal" role="form" method = "post" name = "f" action ="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="writer">작성자</label>
								<div class="col-sm-10">
									<p><%=util.getConvert(writer)%></p><br>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="title">제목</label>
								<div class="col-sm-10">
									<p><%=util.getConvert(title)%></p><br>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="content">내용</label>
								<div class="col-sm-10">
									<p><%= util.getConvert(content)%></p><br>
								</div>
							</div>
							
							<!-- num값을 보이지 않게 전송함 -->
							<input type="hidden" name = "num" value = "<%=num%>" > 
						</form>

						<div class="text-right">
								<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						
						<script>
						$(function(){
							$('#modifyNotice').on('click',function(event){
								event.preventDefault(); // 원래의 하이퍼링크 기능을 없애는 소스
								//유효성 검사
								f.action = "modify.jsp";
								f.submit();
							});
							
							$('#deleteNotice').on('click',function(event){
								event.preventDefault(); // 원래의 하이퍼링크 기능을 없애는 소스								
								//유효성 검사 필요 없음.
								f.action = "delete.jsp";
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