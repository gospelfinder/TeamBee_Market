<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${msg==false }">
	<script type="text/javascript">
		alert('아이디 또는 비밀번호가 다릅니다.');
	</script>
</c:if>
<html>
<%@include file="/WEB-INF/views/include/header_login.jsp"%>
	<div class="container login_height">
	    <div class="row login_position mx-auto">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">로그인</h5>
	            <form class="form-signin" action="login" method="post">
	              <div class="form-label-group">
	                <input type="text" id="inputId" name="MEMBER_ID" class="form-control" placeholder="아이디" required autofocus>
	                <label for="inputId">아이디</label>
	              </div>
	
	              <div class="form-label-group">
	                <input type="password" id="inputPassword" name="MEMBER_PW" class="form-control" placeholder="비밀번호" required>
	                <label for="inputPassword">비밀번호</label>
	              </div>
	
	              <div class="custom-control custom-checkbox mb-3 find_id_pw_div">
	                <input type="checkbox" class="custom-control-input" id="customCheck1">
	                <label class="custom-control-label" for="customCheck1">비밀번호 기억하기</label>
	                <a href="find_id_pw" class="find_id_pw_a">아이디/비밀번호 찾기</a>
	              </div>
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
	             
	              <hr class="my-4">
	              <p>아직 회원이 아니신가요?</p>
	              <button class="btn btn-lg btn-outline-warning btn-block text-uppercase" value="회원가입" onclick="location.href='join'">회원가입</button>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  <%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>