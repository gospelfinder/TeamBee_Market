<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="wrap_auto">
 
  <div class="bg-light py-3">
      <div class="container ">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">전체 상품</strong></div>
        </div>
      </div>
    </div>
<div class="container category-margin-top">
  <div class="row">
		<c:forEach items="${list}" var="list">
		        <div class="col-lg-3 col-sm-6 mb-4 category-content-width">
		            <div class="portfolio-item">
		              
		                <a href="detail?PRODUCT_BNO=${list.PRODUCT_BNO}"><img class="img-fluid index_image_size" src="${list.PRODUCT_IMG}" alt="TV" /></a>
		               
		                <div class="portfolio-caption">
		                    <div class="portfolio-caption-heading">	${list.PRODUCT_TITLE}</div>
		                    <div class="portfolio-caption-subheading text-muted">${list.PRODUCT_PRICE} 원</div>
		                </div>
		            </div>
		        </div>       
		</c:forEach>
	</div>
    </div>
  </div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>