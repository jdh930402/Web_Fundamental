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
<script>
	const pageLoad = function(cPage){
		let url = 'http://localhost/dept/list.jsp?page=' + cPage;
		history.pushState(null, null, url); 
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'list_ajax.jsp?page=' + cPage,
			error : function(){
				alert('환영합니다.');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}
		}); // 버튼을 눌렀을때 ajax(메서드로 클릭시 사용가능)	
	}

	$.ajax({
		type : 'GET',
		dataType : 'html',
		url : 'list_ajax.jsp?page=<%=cPage%>',
		error : function(){
			alert('환영합니다.');
		},
		success : function(html){
			$('.table-responsive-md').children().remove();
			$('.table-responsive-md').html(html);
		}
	}); // 홈페이지 접속 ajax(window.onload시 자동실행)

	$(window).on('popstate',function(){
		let url = location.search;
		let cPage = new URLSearchParams(url).get("page");
		$.ajax({
			data : 'GET',
			dataType : 'html',
			url : 'list_ajax.jsp?page=' + cPage,
			error : function(){
				alert('popstate error');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}
		});
			
			
			
			
		});
</script>
<%@ include file = "/inc/footer.jsp"%>	