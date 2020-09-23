<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
	img{
		width:100px;
		height:100px;
	}
</style>
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  <div class="site-wrap">
    

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">내 찜 목록</strong></div>
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
                  	<th>이미지</th>
                    <th class="product-thumbnail">상품명</th>
                    <th class="product-thumbnail">상품 내용</th>
                    <th style="width:120px;"class="product-quantity">가격</th>
                    <th style="width:80px;" class="product-quantity"></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="list">
                  <tr>
                  	<td>
                  		<a href="detail?PRODUCT_BNO=${list.PRODUCT_BNO}"><img src="${list.FAVORITE_IMG}"></a>
                  	</td>
                  	<td class="product-thumbnail">
                    	<a href="detail?PRODUCT_BNO=${list.PRODUCT_BNO}">${list.FAVORITE_TITLE}</a>
                    </td>
                    <td class="product-thumbnail">
                    	${list.FAVORITE_CONTENT}
                    </td>
                   
                    <td class="product-name">
                   	 	<fmt:formatNumber pattern="###,###,###" value="${list.FAVORITE_PRICE}" />원
                    </td>
               		<td>
               			<a href="insertCart?PRODUCT_BNO=${list.PRODUCT_BNO}&MEMBER_ID=${member.MEMBER_ID}" class="btn btn-primary btn-sm">담기</a>
               			<p>
                    	<a href="deleteFavorite?PRODUCT_BNO=${list.PRODUCT_BNO}&MEMBER_ID=${member.MEMBER_ID}" class="btn btn-primary btn-sm">삭제</a>
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