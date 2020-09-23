<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap_auto">
	<div class="container qna-padding">
		<h2>Q&A</h2>
	</div>
	
	<table class="table container qna-detail-table">
		<tr class="qna-detail-upperPart">
			<td>${vo.QNA_BNO}</td>
			<td>${vo.QNA_TITLE}</td>
			<td><fmt:formatDate value="${vo.QNA_REGDATE}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr class="qna-detail-writer">
			<th>작성자</th>
			<td colspan="2">${vo.QNA_WRITER}</td>
		</tr>
		<tr class="qna-detail-content">
			<td colspan="3" style="height:300px;">${vo.QNA_CONTENT}</td>
		</tr>
		<tr>
			<th colspan="3">관리자 답변</th>
		</tr>
		
		<tr class="qna-detail-content">
			<td colspan="3" style="height:100px;">${vo.QNA_REPLY}&nbsp;&nbsp;
				<c:choose>
					<c:when test="${vo.QNA_REPLY==null}">
						<c:if test="${member.MEMBER_ID!='admin'}">
							<p>답변이 아직 등록되지 않았습니다.</p>
						</c:if>
						<c:if test="${member.MEMBER_ID=='admin'}">
							<form action="qnaReply_insert">
								<input type="hidden" name="QNA_BNO" value="${vo.QNA_BNO }"/>
								<textarea id="summernote" name="QNA_REPLY"></textarea>
								<input class="btn btn-warning qna-detail-btn" type="submit" value="작성">
							</form>
						</c:if>
					</c:when>
					<c:when test="${vo.QNA_REPLY!=null}">
						<c:if test="${member.MEMBER_ID=='admin'}">
							<a href="qnaReply_delete?QNA_BNO=${vo.QNA_BNO}"><button class="btn btn-warning qna-detail-btn">삭제</button></a>
						</c:if>
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="3" class="qna-btn-overflow">
				<button type="button" class="btn btn-warning qna-btn" value="목록으로" onclick="location.href='qna'">목록으로</button>
				&nbsp;&nbsp;
				<c:if test="${member.MEMBER_ID==vo.QNA_WRITER}">
					<button type="button" class="btn btn-warning qna-btn" value="수정하기" onclick="location.href='qna_update?QNA_BNO=${vo.QNA_BNO}'">수정하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-warning qna-btn" value="삭제하기" onclick="location.href='qna_delete?QNA_BNO=${vo.QNA_BNO}'">삭제하기</button>
				</c:if>
			</td>
		</tr>
	</table>
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