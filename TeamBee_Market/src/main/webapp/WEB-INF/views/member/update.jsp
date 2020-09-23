<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	$(document).ready(function() {
		$("form").submit(function() {
			//비밀번호 일치 확인
			var pw = $("input[name='MEMBER_PW']");
			var rePw = $("input[name='MEMBER_PW2']");

			if (pw.val() != rePw.val()) {
				alert('입력한 두 개의 비밀번호가 일치하지 않습니다.');
				$("#pw").focus();
				return false;
			}
	
		});		
	});
</script>
</head>
<html>
<%@include file="/WEB-INF/views/include/header_login.jsp"%>
	<br>
	<div class="wrap_auto">
	
	<div class="container">
		<h2>정보 수정</h2>
	</div>
	<br>
	<form action="updateMember" method="post">
	<table class="table container">
		
		<tr>
			<td>아이디</td>
			<td>${vo.MEMBER_ID}</td>
				
		</tr>
		<tr>
			<td>이름</td>
			<td>${vo.MEMBER_NAME}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" id="inputPassword" name="MEMBER_PW" class="form-control register_phone_01" placeholder="비밀번호" required>
				 <span class="register_float_left">&nbsp;&nbsp;</span>
	        	<input type="password" id="inputPassword" name="MEMBER_PW2" class="form-control register_phone_01" placeholder="비밀번호 재입력" required>
	        </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><select name="MEMBER_PHONE1" id="member_Phone" class="form-control register_phone_01">
						      	<option value="010">010</option>
						      	<option value="011">011</option>
						      	<option value="016">016</option>
						      	<option value="017">017</option>
						      	<option value="018">018</option>
						      	<option value="019">019</option>
						      </select>
						       <span class="register_float_left">&nbsp;-&nbsp;</span>
						      <input type="text" name="MEMBER_PHONE2" id="member_Phone_02" class="form-control register_phone_02" maxlength="4" required>
						      <span class="register_float_left">&nbsp;-&nbsp;</span>
						      <input type="text" name="MEMBER_PHONE3" id="member_Phone_03" class="form-control register_phone_03" maxlength="4" required>
						      
			</td>
				
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" class="form-control" name="MEMBER_EMAIL" value="${vo.MEMBER_EMAIL}"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input class="form-control" id="addr1"style="width: 40%; display: inline;" name="MEMBER_ADDRESS1" placeholder="우편번호" type="text" >
				<button type="button" class="btn btn-warning" onclick="execPostCode();"><i class="fa fa-search"></i> 주소 찾기</button>
				<input class="form-control" style="top: 5px;" name="MEMBER_ADDRESS2" id="addr2" type="text" placeholder="도로명 주소"readonly="readonly" />
				<input class="form-control" name="MEMBER_ADDRESS3" id="addr3" type="text" placeholder="상세 주소" /> 
			</td>
		</tr>

		<tr>
			<td colspan="2" class="update-overflow">
				<button type="submit" class="btn btn-warning update-float-right" value="저장">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-warning update-float-right" value="삭제하기" onclick="location.href='deleteMember?MEMBER_ID=${vo.MEMBER_ID}'">탈퇴하기</button>
				<input type="hidden" name="MEMBER_ID" value="${vo.MEMBER_ID}"/>	
			</td>
		</tr>
	</table>
	</form>
	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script>
	function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                
	                $("[id=addr1]").val(data.zonecode);
	                $("[id=addr2]").val(fullRoadAddr);
	                
	                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('addr2').value = fullAddr;
	            }
	         }).open();
	     }
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>