<%@page import="java.util.Calendar"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "/inc/header.jsp" %>
<%
	String tempYear = request.getParameter("year");
	Calendar calendar = Calendar.getInstance();
	int cYear = calendar.get(Calendar.YEAR);
	if(tempYear == null || tempYear.length() == 0){
		tempYear = String.valueOf(cYear);
	}
	try{
		cYear = Integer.parseInt(tempYear);
	} catch(NumberFormatException e){
		cYear = Calendar.YEAR;
	}
	
%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Legister</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" >
						K리그1 정규 라운드 팀별 순위
						<select id = 'year' name = 'year' style = "float: right;">
						<%for(int i = cYear ; i >= 1983 ; i--){ %>
						<option value = '<%=i%>'><%=i%></option>
						<%} %>
						</select>		
						</h5>
						
						<div class="table-responsive-md">
									
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	
		$('#year').on('change',function(){
			let url = "http://localhost/crawling/crawling.jsp?year="+$('#year option:selected').val();
			history.pushState(null, null, url)
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'crawling_ajax.jsp?year='+$('#year option:selected').val(),
				error : function(){
					alert('에러발생');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}	
			})
		});
	
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'crawling_ajax.jsp?year='+$('#year option:selected').val(),
			error : function(){
				alert('에러발생');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}	
		});
		
		$(window).on('popstate', function(){
			let url = location.search;
			let cYear = new URLSearchParams(url).get("year");
			console.log(cYear);
			
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'crawling_ajax.jsp?year='+cYear,
				error : function(){
					alert('error 발생');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}
				
			});
		});
	
	
	</script>

<%@include file= "/inc/footer.jsp"%>