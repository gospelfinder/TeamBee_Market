<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>



<div class="wrap_auto container">
<div class="notice-write-padding-top notice-write-padding">
	<h2>공지사항 글 작성</h2>
</div>
	<div class="container">
	<form method="post" action="insertNotice">
		<table class="container">
			<tr>
				<td class="notice-write-padding">
					<input type="text" class="notice-write-input form-control" name="NOTICE_TITLE" placeholder="제목을 입력하세요."/>
				</td>
			</tr>
			<tr>
				<td class="notice-write-padding">
					<textarea id="summernote" name="NOTICE_CONTENT"></textarea>
				</td>
			</tr>
			<tr>
				
				<td class="notice-write-padding notice-write-padding-bottom">
					<input type="hidden" name="NOTICE_WRITER" value="관리자"/>
					<input id="subBtn" type="submit" value="글 작성" class="btn btn-warning notice-btn"/>
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

<!-- 
<script>

//서머노트에 text 쓰기
$('#summernote').summernote('insertText');


// 서머노트 쓰기 비활성화
$('#summernote').summernote('disable');

// 서머노트 쓰기 활성화
$('#summernote').summernote('enable');


// 서머노트 리셋
$('#summernote').summernote('reset');


// 마지막으로 한 행동 취소 ( 뒤로가기 )
$('#summernote').summernote('undo');
// 앞으로가기
$('#summernote').summernote('redo');
</script>
 -->

</body>
</html>