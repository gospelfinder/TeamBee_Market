<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="wrap_auto container">
<div class="qna-write-padding-top qna-write-padding">
	<h2>Q&A 글 작성</h2>
</div>

<div class="container">
	<form method="post" action="qna_write">
		<table class="container">
			<tr>
				<td colspan="2" class="qna-write-padding">
					<input type="text" name="QNA_TITLE" class="qna-write-input form-control"  placeholder="제목을 입력하세요."/>
				</td>
				<td>
					<input type="hidden" name="QNA_WRITER" value="${member.MEMBER_ID }"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="notice-write-padding">
					<textarea id="summernote" name="QNA_CONTENT"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="qna-write-padding qna-write-padding-bottom">
					<input id="subBtn" type="submit" value="글 작성" class="btn btn-warning qna-btn"/>
				</td>
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