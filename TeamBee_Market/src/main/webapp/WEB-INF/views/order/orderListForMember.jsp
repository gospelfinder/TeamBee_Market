<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  <div class="site-wrap">
    

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">내 주문 목록</strong></div>
        </div>
      </div>
    </div>
	
	<br>
    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-check">주문번호</th>
                    <th class="product-check">회원 아이디</th>
                    <th class="product-thumbnail">상품명</th>
                    <th class="product-thumbnail">주문날짜</th>
                    <th class="product-quantity">수량</th>
                    <th class="product-total">배송상태</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${listForMember }" var="order">
                  <tr>
                  	<td>
                  		${order.ORDER_BNO}
                  	</td>
                  	<td class="product-thumbnail">
                    	${order.MEMBER_ID}
                    </td>
                    <td class="product-thumbnail">
                    	<a href="detail?PRODUCT_BNO=${order.PRODUCT_BNO }">
                    		${order.PRODUCT_TITLE}
                    	</a>
                    </td>
                    <td class="product-name">
                   		<fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy-MM-dd"/>		
                    </td>
                   
                    <td class="product-name">
                   		${order.ORDER_AMOUNT}
                    </td>
                    <td>
						${order.ORDER_STATUS}
                    </td>

               
                  </tr>
				</c:forEach>
                </tbody>
              </table>
            </div>
          </form>
        </div>
      </div>
  	</div>
  </div>
    <%@include file="/WEB-INF/views/include/footer.jsp"%>

</html>