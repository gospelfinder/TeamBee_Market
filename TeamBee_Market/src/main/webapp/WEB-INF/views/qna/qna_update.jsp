<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>
<div class="wrap_auto container">
	<div class="qna-write-padding-top qna-write-padding">
	<h2 style="text-align: center;">Q&A 글 수정</h2>
	</div>

<div class="container">
	<form action="updateQna" method="post">
		<table class="table container qna-update-table">
			<tr>
				<td>번호</td>
				<td>${vo.QNA_BNO}</td>
				<td><input type="hidden" name="QNA_BNO" value="${vo.QNA_BNO}"></td>
			</tr>
			<tr>
				<td class="vertical-align-middle">제목</td>
				<td colspan="2"><input type="text" class="form-control" placeholder="제목을 입력하세요" value="${vo.QNA_TITLE}" name="QNA_TITLE" /></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="2">${vo.QNA_REGDATE}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2">${vo.QNA_WRITER}</td>
			</tr>
			<tr>
				<td class="vertical-align-middle">내용</td>
				<td colspan="2"><textarea id="summernote" name="QNA_CONTENT">${vo.QNA_CONTENT}</textarea></td>
			</tr>
			<tr>
				<td colspan="3" class="qna-btn-overflow">
				<input class="btn btn-warning qna-btn" type="submit" value="수정완료"/></td>
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