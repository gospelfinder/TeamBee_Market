<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	var list = new Array();

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
<%@include file="/WEB-INF/views/include/header_login.jsp"%>
<c:forEach items="${memberList }" var="member">
	<script>
		list.push("${member.MEMBER_ID}");
	</script>
</c:forEach>


	
				<div class="wrap_auto container join-wrap">
					<div class="join-padding">
						<h2 class="join-h2">회원가입</h2>
					</div>
					<form class="form-horizontal" action="insertMember">
		
						<div class="form-group row">
							<label for="member_Id" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-10 join_id_div">
								<input type="text" name="MEMBER_ID" class="form-control join_id" id="MEMBER_ID" placeholder="아이디" required autofocus/>
								<input type="button" class="btn-primary btn-sm join_id_button" id="idCheck" value="중복검사"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="member_Pw" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" name="MEMBER_PW" class="form-control"
									id="member_Pw" placeholder="영문, 숫자, 특수문자 조합 6자 이상 15자 이하로 입력"
									required>
							</div>
						</div>
						<div class="form-group row">
							<label for="member_ConfirmPw" class="col-sm-2 control-label">비밀번호
								확인</label>
							<div class="col-sm-10">
								<input type="password" name="MEMBER_PW2"
									class="form-control" id="member_ConfirmPw"
									placeholder="비밀번호와 동일하게 입력" required>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="" class="col-sm-2 control-label">질문</label>
							<div class="col-sm-10">
								<p>가장 기억에 남는 장소는 어디인가요?</p>
								<input type="text" name="MEMBER_QUESTION" class="form-control"
									id="member_Question" placeholder="답변" required>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="member_Name" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-10">
								<input type="text" name="MEMBER_NAME" class="form-control"
									id="member_Name" placeholder="이름" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="member_Birth" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-10">
								<input type="text" name="MEMBER_BIRTH" class="form-control"
									id="member_Birth" placeholder="생년월일 8자리 숫자로 입력 (ex.19910101)"
									maxlength="8" required>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="member_Email" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" name="MEMBER_EMAIL" class="form-control"
									id="member_Email" placeholder="이메일 (ex. teambee@teambee.com)"
									required>
							</div>
						</div>
						<div class="form-group row">
							<label for="member_Phone" class="col-sm-2 control-label">핸드폰
								번호</label>
							<div class="col-sm-10">
								<select name="MEMBER_PHONE1"
									class="form-control register_phone_01">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> <span class="register_float_left">&nbsp;-&nbsp;</span> <input
									type="text" name="MEMBER_PHONE2" id="member_Phone_02"
									class="form-control register_phone_02" maxlength="4" required>
								<span class="register_float_left">&nbsp;-&nbsp;</span> <input
									type="text" name="MEMBER_PHONE3" id="member_Phone_03"
									class="form-control register_phone_03" maxlength="4" required>
							</div>
						</div>


						<div class="form-group row join-address">
							<label for="member_Address" class="col-sm-2 control-label">주소</label>
							<div class="col-sm-10">
								<input class="inputZipCode" name="MEMBER_ADDRESS1" id="addr1" type="text" placeholder="우편번호" readonly="readonly">
								<button type="button" class="btn btn-warning btn_zip" onclick="execPostCode();">
									<i class="fa fa-search"></i> 주소 찾기
								</button>
							</div>
						</div>
						<div class="form-group row">
							<label for="member_Address" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input class="inputAddress"
									name="MEMBER_ADDRESS2" id="addr2" type="text"
									readonly="readonly" placeholder="도로명주소" />
							</div>
						</div>
						<div class="form-group row">
							<label for="member_Address" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								
								<input class="inputDetailAddress" name="MEMBER_ADDRESS3" id="addr3"
									type="text" placeholder="상세주소"/> 
							</div>
						</div>

						<hr>
						
						<button class="btn btn-lg btn-primary btn-block"
							type="submit">회원가입하기</button>
							

					</form>
				</div>
			

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
	<script>
		$('#idCheck').on('click', function(event) {
			var test = 0;
			
			for (var i = 0; i < list.length; i++) {

				if ($("#MEMBER_ID").val() == list[i]) {
					test += i;
				}

			}
			if(MEMBER_ID.value ==""){
				alert('아이디를 입력하세요.');
			}else{
				if (test > 0) {
					alert('중복된 아이디 입니다.');
				} else {
					alert('사용 가능한 아이디 입니다.');
				}
			}
			

		});

		function join(){

		    var MEMBER_NAME = document.getElementById("MEMBER_NAME");//이름
		    var MEMBER_BIRTH = document.getElementById("MEMBER_BIRTH");//생년월일
		    var MEMBER_PHONE2 = document.getElementById("MEMBER_PHONE2");//핸드폰 2째
		    var MEMBER_PHONE3 = document.getElementById("MEMBER_PHONE3");//핸드폰 3째
		    var MEMBER_ADDRESS3 = document.getElementById("MEMBER_ADDRESS3");//핸드폰 3째
		    var regExpName = /^[가-힝a-zA-Z]{2,20}$/; //이름에 사용할 정규 표현식
		    var regExpNum = /[0-9]$/;
		    
		    
		    
		    if(!IdPwCheck()){ //아이디 비밀번호 검사
		        return false;
		    }else if(MEMBER_NAME.value ==""){
		    	alert("성함을 입력해주세요.");
		    	setTimeout(function(){MEMBER_NAME.focus();}, 1)
		    	return false;
		    }else if(!regExpName.test(MEMBER_NAME.value)){ //이름 검사
		        alert("성함을 잘못 입력하셨습니다.");
		        MEMBER_NAME.value== "";
		        $(MEMBER_NAME).val('');
		        setTimeout(function(){MEMBER_NAME.focus();}, 1)
		        return false;
		    }else if(MEMBER_BIRTH.value ==""){
		    	alert("생년월일을 입력해주세요.");
		    	setTimeout(function(){MEMBER_BIRTH.focus();}, 1)
		    	return false;
		    }else if(!regExpNum.test(MEMBER_BIRTH.value)){ //생년월일 숫자 검사
		        alert("생년월일을 숫자로 입력해주세요.");
		        $(MEMBER_BIRTH).val('');
		        setTimeout(function(){MEMBER_BIRTH.focus();}, 1)
		        return false;
		    }else if(!EmailCheck()){ //이메일 검사
		        return false;
		    }else if(MEMBER_PHONE2.value ==""){
		    	alert("핸드폰 가운데 자리를 입력해주세요.");
		    	setTimeout(function(){MEMBER_PHONE2.focus();}, 1)
		    	return false;
		    }else if(!regExpNum.test(MEMBER_PHONE2.value)){ //핸드폰 숫자 검사
		        alert("핸드폰 가운데 자리를 잘못 입력하셨습니다.");
		        $(MEMBER_PHONE2).val('');
		        setTimeout(function(){MEMBER_PHONE2.focus();}, 1)
		        return false;
		    }else if(MEMBER_PHONE3.value ==""){
		    	alert("핸드폰 마지막 자리를 입력해주세요.");
		    	setTimeout(function(){MEMBER_PHONE3.focus();}, 1)
		    	return false;
		    }else if(!regExpNum.test(MEMBER_PHONE3.value)){ //핸드폰 숫자 검사
		        alert("핸드폰 마지막 자리를 잘못 입력하셨습니다.");
		        $(MEMBER_PHONE3).val('');
		        setTimeout(function(){MEMBER_PHONE3.focus();}, 1)
		        return false;
		   
		    }else if(MEMBER_ADDRESS3.value ==""){
		    	alert("주소를 입력해주세요.");
		    	setTimeout(function(){MEMBER_ADDRESS3.focus();}, 1)
		    	return false;
		    }else if(MEMBER_ADDRESS3.value ==""){
		    	alert("상세주소를 입력해주세요.");
		    	setTimeout(function(){MEMBER_ADDRESS3.focus();}, 1)
		    	return false;
		    }else{
		        alert("회원가입이 완료되었습니다.");
		        return true;
			}
		}


		function IdPwCheck(){
		    var objId = document.getElementById("MEMBER_ID"); //아이디 id
		    var objPw = document.getElementById("MEMBER_PW"); //비밀번호 id
		    var objPwCheck = document.getElementById("MEMBER_PW2"); //비밀번호확인id
		    var regExpPw = /(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{6,15}$/; //비밀번호에 사용할 정규표현식
		    
		    if(objPw.value != objPwCheck.value){ //비밀번호 확인이 다를 경우 false 반환
		        alert("비밀번호와 비밀번호 확인이 다릅니다.");
		        $(objPwCheck).val('');
		        setTimeout(function(){objPwCheck.focus();}, 1)
		        return false;
		    }else if(objPw.value == objId.value){ //아이디 비밀번호가 같을 경우 false 반환
		        alert("아이디와 비밀번호를 다르게 만들어주세요.");
		        $(objPw).val('');
		        $(objPwCheck).val('');
		    	setTimeout(function(){objPw.focus();}, 1)
		        return false;
		    }else if(!regExpPw.test(objPw.value)){ //비밀번호 정규표현식 검사
		        alert("비밀번호를 숫자, 특수문자, 영문 조합으로 만드세요.");
		        $(objPw).val('');
		        $(objPwCheck).val('');
		        setTimeout(function(){objPw.focus();}, 1)
		        return false;
		    }else{
		        return true;
		    }
		} //Id/Pw 검사 end

		 
		function EmailCheck(){ //이메일 확인 함수
		    var objEmail = document.getElementById("MEMBER_EMAIL"); //usermail text 할당
		     var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //이메일 규칙 정규표현식 /^:문자열 시작 표현 \w:영문 대소문자, 숫자 +:1회 이상 {2,5}:2번 이상 5번 이하 $/:문자열 마지막 표현 
		    if( !regExpEmail.test(objEmail.value)){ //이메일 값을 정규표현식과 비교하여 true or false 반환
		    alert("이메일을 형식에 맞게 입력해주세요.");
		    $(objEmail).val('');
		    setTimeout(function(){objEmail.focus();}, 1)
		    return false;
		    }else{ //검사 통과시 true 반환
		        return true;
		    }
		} //이메일 검사 end
		
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
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