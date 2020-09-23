<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="wrap_auto">
		<div class="container notice-padding">
			<h2>공지사항</h2>
		</div>
	
	
	<table class="table table-hover container notice-table">
	<!-- 
		<thead>
			<tr class="notice-table-upper-line">
				<td colspan="6" class="search form-inline notice-search">
			        <select name="searchType" class="form-control" style="float:right;">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				    </select>
			
				    <input type="text" class="form-control" name="keyword" id="keywordInput" value="${scri.keyword}" style="float:right;"/>
				
				    <button id="searchBtn" class="btn btn-primary" type="button" style="float:right;">검색</button>
				  	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
					<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
					<script>
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      });   
				    </script>
			       
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
		    </tr>
	  	</thead>
	  <c:forEach items="${list}" var="list">
	  <tbody>
	    <tr>
	      <th scope="row">${list.NOTICE_BNO}</th>
	      <td><a href="noticeDetail?NOTICE_BNO=${list.NOTICE_BNO}">${list.NOTICE_TITLE}</a></td>
	      <td>${list.NOTICE_WRITER}</td>      
	      <td><fmt:formatDate value="${list.NOTICE_REGDATE}" pattern="yyyy-MM-dd"/></td>
	    </tr>
	  </tbody>
	  </c:forEach>
	  <tfoot>
	  	<tr>
	  		<td colspan="5" class="notice-btn-overflow">
	  			<c:if test="${member.MEMBER_ID=='admin'}">
					<button type="button" class="btn btn-warning notice-btn" value="글작성" onclick="location.href='insertNotice'">글작성</button>
				</c:if>	  			
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