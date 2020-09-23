<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap">
	<div class="container notice-padding">
		<h2>공지사항</h2>
	</div>
	
	<table class="table container notice-detail-table">
		<tr class="notice-detail-upperPart">
		
			<td>${vo.NOTICE_BNO}</td>
			
			<td>${vo.NOTICE_TITLE}</td>
			
			<td><fmt:formatDate value="${vo.NOTICE_REGDATE}" pattern="yyyy-MM-dd"/></td>
			
		</tr>
		<tr class="notice-detail-writer">
			<th>작성자 :</th>
			<td colspan="2">${vo.NOTICE_WRITER}</td>
		</tr>
		<tr class="notice-detail-content">
			<td colspan="3" style="height:300px;">${vo.NOTICE_CONTENT}</td>
		</tr>

	
		<tr>
			<td colspan="3" class="notice-btn-overflow">
				<button type="button" class="btn btn-warning notice-btn" value="목록으로" onclick="location.href='noticeList'">목록으로</button>
				
				<c:if test="${member.MEMBER_ID=='admin'}">
					<button type="button" class="btn btn-warning notice-btn" value="수정하기" onclick="location.href='updateNotice?NOTICE_BNO=${vo.NOTICE_BNO}'">수정하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-warning notice-btn" value="삭제하기" onclick="location.href='deleteNotice?NOTICE_BNO=${vo.NOTICE_BNO}'">삭제하기</button>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>