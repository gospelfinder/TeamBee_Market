<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>
<div class="wrpa_auto container">
	<div class="notice-write-padding-top notice-write-padding">
		<h2 style="text-align: center;">공지사항 글 수정</h2><br><br>
	</div>

<div class="container">
	<form action="updateNotice" method="post">
		<table class="table container notice-update-table">
			<tr>
				<td class="vertical-align-middle">제목</td>
				<td><input type="text" class="form-control" placeholder="제목을 입력하세요." value="${vo.NOTICE_TITLE}" name="NOTICE_TITLE" /></td>
			</tr>
			<tr>
				<td class="vertical-align-middle">내용</td>
				<td><textarea id="summernote" name="NOTICE_CONTENT">${vo.NOTICE_CONTENT }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="notice-btn-overflow">
				<input type="hidden" name="NOTICE_BNO" value="${vo.NOTICE_BNO}">
				<input class="btn btn-warning notice-btn" type="submit" value="수정완료"/></td>
			</tr>
		</table>
	</form>
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});
</script>


</body>
</html>