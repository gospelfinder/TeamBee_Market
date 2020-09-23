<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="wrap_auto">
	<div class="container memberList-padding">
		<h2>회원목록</h2>
	</div>
	
	<table class="table table-hover container memberList-table">
	  <thead>
	    <tr class="memberList-tr-th">
	      <th scope="col">아이디</th>
	      <th scope="col">이름</th>
	      <th scope="col">생일</th>
	      <th scope="col">주소</th>
	      <th scope="col">이메일</th>
	      <th scope="col">연락처</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${memberList }" var="list">
		    <tr class="memberList-tr-td">
		      <th scope="row">${list.MEMBER_ID }</th>
		      <td>${list.MEMBER_NAME}</td>
		      <td>${list.MEMBER_BIRTH}</td>
		      <td>${list.MEMBER_ADDRESS}</td>
		      <td>${list.MEMBER_EMAIL}</td>
		      <td>${list.MEMBER_PHONE}</td>
		    </tr>
	    </c:forEach>
	  </tbody>
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