<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	    <div class="row">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">ID / PW 찾기</h5>
	              <div class="form-label-group">
	              <label for="inputEmail">아이디</label>
	              <h5>${find.MEMBER_ID}</h5>
	              </div>
					<br>
	              <div class="form-label-group">
	                <label for="inputName">비밀번호</label>
	                <h5>${find.MEMBER_PW}</h5>
	              </div>
        		  <br><br>
	             <a href="login">
              		<button class="btn btn-lg btn-primary btn-block text-uppercase">로그인</button>
              	</a>      
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>