<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<c:if test="${msg==false }">
	<script type="text/javascript">
		alert('이메일 주소 또는 질문의 답변이 다릅니다.');
	</script>
</c:if>

	<div class="container">
	    <div class="row">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">ID / PW 찾기</h5>
	            <form class="form-signin" action="find" method="post">
	              <div class="form-label-group">
	               <label for="inputEmail">이메일 주소</label>
	               <input type="email" name="MEMBER_EMAIL" class="form-control" placeholder="이메일 주소" required>
	              </div>
					<br>
	              <div class="form-label-group">
	                <h5>기억에 남는 장소는?</h5>
	              </div>
	              
	              <div class="form-label-group">
	              <label for="inputName">답변</label>
	              <input type="text" name="MEMBER_QUESTION" class="form-control" placeholder="" required autofocus>
	              </div>
        		  <br><br>
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">찾기</button>
	            </form>       
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>



<%@include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>