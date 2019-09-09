<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Shorten URL</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Qrcode Generator</h5>
            
               <form name = 'f' method = 'post' action = 'check_login.jsp'>
              <div class="form-group">
                <input type="text" class="form-control" id="url" name = "url" value="http://"/>
                <div id = "emailMessage" class = "message"> </div>
              </div>
              	<div class="form-group">
               		<p id = "shortenUrl" class = "shortenUrl"> shorten </p>
               		
           		</div>
           		
           		<a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i>Shorten URL GENERATOR</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 <script>
 	$('#refreshNumber').on('click', function(event){
 		event.preventDefault();
 		if( $('#url').val() == "" ){
 			alert('URL을 입력하세요.');
 			$('#url').focus();
 			return;
 		}
 		
 		$.ajax({
 			type : 'GET',
 			dataType : 'json',
 			url : 'createShortenUrl.jsp?url=' + $('#url').val(),
 			error : function(){
 				alert('ajax error');
 			},
 			success : function(json){
 				if(json.message == "ok"){
 					console.log(json);
 					let shorten = json.result.url;
 					$('.shortenUrl').html(shorten);
 				}else{
 					alert('주소를 다시 확인해주세요.');
 				}
 			}
 		});
 	});
 </script>
<%@include file="/inc/footer.jsp"%>