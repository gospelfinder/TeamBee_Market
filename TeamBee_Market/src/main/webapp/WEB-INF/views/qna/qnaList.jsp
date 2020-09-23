<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var success = ${member.MEMBER_ID != null};
	var failure = ${member.MEMBER_ID == null};
	
	function qna_write() {
		if (success) {
			location.href = "qna_write";
		} else if (failure) {
			alert("로그인 후 이용 가능합니다.");
			location.href = "login";
		}
	}

</script>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap_auto">
	<div class="container qna-padding">
		<h2>Q&A</h2>
	</div>
	
	<table class="table table-hover container qna-table">
	<!-- 
		<thead>
			<tr class="qna-table-upper-line">
				<td colspan="6">
			        <form class="form-inline qna-search" action="#">
			          <input class="form-control qna-search-input" type="text" placeholder="검색어를 입력하세요.">
			         	<button class="btn btn-primary" type="submit">검색</button>
			        </form>
		        </td>            
			</tr>
		</thead>
	 -->
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">등록날짜</th>
	      <th scope="col">답변여부</th>
	    </tr>
	  </thead>
	  <c:forEach items="${qnaList }" var="list">
	  <tbody>
	    <tr>
	      <th scope="row">${list.QNA_BNO }</th>
	      <td><a href="qna_detail?QNA_BNO=${list.QNA_BNO }">${list.QNA_TITLE}</a></td>
	      <td>${list.QNA_WRITER}</td>
	      <td>${list.QNA_REGDATE}</td>
	      <c:choose>
		      <c:when test="${list.QNA_REPLY==null}">
		      	<td>답변대기</td>
		      </c:when>
		      <c:when test="${list.QNA_REPLY!=null}">
		      	<td>답변완료</td>
		      </c:when>
		  </c:choose>
	    </tr>
	  </tbody>
	  </c:forEach>
	  <tfoot>
	  	<tr>
	  		<td colspan="5" class="qna-btn-overflow">
	  			<button type="button" class="btn btn-warning qna-btn" value="글작성" onclick="qna_write()">글작성</button>
	  		</td>
	  	</tr>
	  </tfoot>
	</table>
	
	<ul class="pagination justify-content-center memberList-pagination-ul">	  
	    <c:if test="${pageMaker.prev}">
	    	<li class="page-item">
	    		<a class="page-link" href="${pageMaker.makeSearch(pageMaker.startPage - 1)}">
	    			<span aria-hidden="false">&laquo;</span>
           			<span class="sr-only">Previous</span>
	    		</a>
	    	</li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    <li class="page-item">
	     		<a class="page-link" href="${pageMaker.makeSearch(idx)}">${idx}</a>
	    	</li>
		 </c:forEach>	
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li class="page-item">
		    	<a class="page-link" href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">
		    		<span aria-hidden="true">&raquo;</span>
		            <span class="sr-only">Next</span>
		    	</a>
	    	</li>
	    </c:if> 
  	</ul>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>