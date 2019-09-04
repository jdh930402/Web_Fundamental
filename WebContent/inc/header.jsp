<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- Font Awesome CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
	<script src="/js/jquery-3.4.1.js"></script>
	<title>Bootstrap Template</title>
	<style>
		a.click_list:hover{
			cursor:pointer;
		}
	</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#563d7c;">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			
<%
	String url = request.getRequestURI();
	int index = 0;
	if(url.endsWith("/register.jsp")){
		index = 1;
	} else if(url.endsWith("/login.jsp")){
		index = 2;
	} else if(url.startsWith("/notice")){
		index = 3;
	} else if(url.startsWith("/emp")){
		index = 4;
	} else if(url.startsWith("/dept")){
		index = 5;
	} else if(url.startsWith("/member")){
		index = 6;
	} 
%>
				<li class="nav-item <%if(index == 0){%> active <%}%>">
					<a class="nav-link" href="/"><i class="fa fa-home"></i> Home</a>
				</li>
				<li class="nav-item <%if(index == 3){%> active <%}%>">
					<a class="nav-link" href="/notice/list.jsp"> <i class="fa fa-exclamation"></i> Notice</a>
				</li>
				<li class="nav-item <%if(index == 4){%> active <%}%>">
					<a class="nav-link" href="/emp/list.jsp"> <i class="fa fa-user"></i> Employee</a>
				</li>
				<li class="nav-item <%if(index == 5){%> active <%}%>">
					<a class="nav-link" href="/dept/list.jsp"> <i class="fa fa-building-o"></i> Department</a>
				</li>
				<li class="nav-item <%if(index == 6){%> active <%}%>">
					<a class="nav-link" href="/member/list.jsp">  <i class="fa fa-user"></i>  Member</a>
				</li>
			</ul>
			<ul class="navbar-nav ">
				<li class="nav-item <%if(index == 1){%> active <%}%>">
					<a class="nav-link" href="/member/register.jsp"><i class="fa fa-registered"></i> Register</a>
				</li>
				<li class="nav-item <%if(index == 2){%> active <%}%>">
					<a class="nav-link" href="/member/login.jsp"><i class="fa fa-user"></i> Login</a>
				</li>
			</ul>
		</div>
	</nav>