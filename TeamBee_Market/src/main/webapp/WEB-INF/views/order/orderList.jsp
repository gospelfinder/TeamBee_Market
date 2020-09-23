<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  
  <div class="wrap_auto">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">주문 현황</strong></div>
        </div>
      </div>
    </div>
	

    <div class="container insert-container-margin">
          <form class="col-md-12" method="post">
              <table class="table table-bordered orderList-table">
                <thead>
                  <tr class="orderList-tr-th">
                    
                    <th scope="col">회원 아이디</th>
                    <th scope="col">상품명</th>
                    <th scope="col">주문날짜</th>
                    <th scope="col">수량</th>
                    <th scope="col">배송상태</th>
                    <th scope="col">배송처리</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList }" var="order">
                  <tr class="orderList-tr-td">
                  	
                  	<td>
                    	${order.MEMBER_ID}
                    </td>
                    <td>
                    	${order.PRODUCT_TITLE}
                    </td>
                    <td>
                   		<fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy-MM-dd"/>		
                    </td>
                    <td>
                   		${order.ORDER_AMOUNT}
                    </td>
                    <td>
						${order.ORDER_STATUS}
                    </td>
                    <c:choose>
                    	<c:when test="${order.ORDER_STATUS=='배송 준비중'}">
                    		<td>
                    		<a href="updateOrder?ORDER_BNO=${order.ORDER_BNO}" class="btn btn-primary btn-sm">배송 처리</a>
                    		</td>
                    	</c:when>
                    	
                    	<c:when test="${order.ORDER_STATUS=='배송완료'}">
                    		<td></td>
                    	</c:when>
                    </c:choose>
                  </tr>
				</c:forEach>
                </tbody>
              </table>
          </form>
        </div>
     
      <div>
      <ul class="pagination justify-content-center orderList-pagination-ul">
    	<li class="page-item">
     		 <a class="page-link" href="#" aria-label="Previous">
           		 <span aria-hidden="true">&laquo;</span>
           		 <span class="sr-only">Previous</span>
         	 </a>
   		</li>

	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		  <li class="page-item">
	     		<a class="page-link" href="${pageMaker.makeSearch(idx)}">${idx}</a>
	    	</li>
		 </c:forEach>	

   		 	<li class="page-item">
    		  	<a class="page-link" href="#" aria-label="Next">
           		 	<span aria-hidden="true">&raquo;</span>
         			 <span class="sr-only">Next</span>
        		  </a>
 			 </li>
 		 </ul>	
      
 </div>
  </div>
    <%@include file="/WEB-INF/views/include/footer.jsp"%>

    
  </body>
</html>