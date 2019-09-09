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
            <h5 class="card-title">Qrcode Generator</h5>
            
               <form name = 'f' method = 'post' action = 'check_login.jsp'>
              <div class="form-group">
                <input type="text" class="form-control" id="url" name = "url" value="http://"/>
                <div id = "emailMessage" class = "message"> </div>
              </div>
              
              <div class="form-row d-flex align-items-center">
                      <div class="form-group col-md-8">
                        <img class="form-control" src="" id="img_form_url"/>
                      </div>
                      <div class="form-group col-md-4">
                        <a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i> GENERATOR</a>
                      </div>
              </div>
        
                 
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
 			url : 'createImage.jsp?url=' + $('#url').val(),
 			dataType : 'json',
 			error : function(){
 				alert('이미지 에러');
 			},
 			success : function(json){
 				console.log(json);
 				if(json.result == "ok"){
 					let imageSrc = json.path;
 					$('#img_form_url').attr('src', imageSrc);
 				}else{
 					alert('이미지가 생성되지 않았습니다.');
 				}
 			}
 		});
 		
 	});
 </script>
<%@include file="/inc/footer.jsp"%>