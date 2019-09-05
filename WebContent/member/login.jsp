<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">로그인</h5>
            <% if(memberDto == null){ %>
            <form name = 'f' method = 'post' action = 'check_login.jsp'>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Your Email *" id="eamil" name = "email" />
                <div id = "emailMessage" class = "message"> </div>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Your Password *" id="pwd" name = "pwd"/>
                <div id = "pwdMessage" class = "message" ></div>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id = "checkLogin" value="Login" />
              </div>
              <div class="form-group">
                <a href="#" class="ForgetPwd" id = "forgetPwd">Forget Password?</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 <script>
	 	$('#checkLogin').on('click', function(event){
 			event.preventDefault();	
	 		if( $('#eamil').val().length == 0){
 				$('#emailMessage').html("<span class = 'text-danger'>아이디를 입력하세요.</span>");
 				$('#email').addClass('is-invalid');
 				$('#email').focus();
	 		}else if( $('#pwd').val().length == 0 ){
	 			$('#pwdMessage').html("<span class = 'text-danger'>비밀번호를 입력하세요.</span>");
	 			$('#email').addClass('is-invalid');
	 			$('#pwd').focus();
	 		}else{
	 			f.submit();
	 		}
	 	});

 </script>
	 <%} else{ %>
 			<h5 class="card-title">로그인을 하셨습니다.</h5>
	 <%} %>
<%@include file="/inc/footer.jsp"%>