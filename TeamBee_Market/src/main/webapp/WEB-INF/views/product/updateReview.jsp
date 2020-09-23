<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">

	  <!-- Portfolio Item Heading -->
	  <h1 class="my-4">
	    <small>${detail.PRODUCT_TITLE}</small>
	  </h1>
	
	  <!-- Portfolio Item Row -->
	  <div class="row">
	    <div class="col-md-8">
	      <div>
			  <img class="img-fluid" src="${detail.PRODUCT_IMG}" alt="상품이미지">
	      </div>
	      
	       <form action="updateReview" method="post">
	    	 <div class="form_wrap_div detail-div-width">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">리뷰 수정</label>
                <p>수정할 상품평과 평점을 입력하세요</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" name="REVIEW_CONTENT" placeholder="수정할 내용 입력">
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
				<input type="hidden" name="PRODUCT_BNO" value="${detail.PRODUCT_BNO}"/>
				<input type="hidden" name="REVIEW_BNO" value="${review.REVIEW_BNO}"/>
			  </div>
            	<br>
		 		<div class="col-md-8 mb-3 mb-md-0 form_div_01">
			 			<input type="number" class="form-control" size="10" value="5" max="5" min="1" autocomplete="off" name="PRODUCT_RATE">
			 	</div>
			 		<br>
			 		<div class="col-md-8 mb-3 mb-md-0 form_div_02 detail_review_btn">
				 		<a href=""><button class="btn btn-warning">수정하기</button></a>
				 		<br><br><br>
			 		</div>
            </div>
		 	</form>
	    </div>

	
	    <div class="col-md-4">
	      <h2 class="my-3">${detail.PRODUCT_TITLE}</h2>
	      <p>${detail.PRODUCT_CONTENT}</p>
	      
	      <h3 class="my-3">${detail.PRODUCT_PRICE}원</h3>
		      <p><fmt:formatDate value="${detail.PRODUCT_REGDATE}" pattern="yyyy-MM-dd"/></p>
		      <p>조회수 ${detail.PRODUCT_HIT}</p>
		      <p>수량 ${detail.PRODUCT_AMOUNT}</p>
		      <p>평점 ${detail.PRODUCT_RATE}</p>

	      

		 	<div class="detail-paddingTop">
		 		<form action="insertOrder">
			 		<div class="detail-paddingBottom-form">
			 			<input type="number" class="form-control" value="1" min="1"  autocomplete="off" name="ORDER_AMOUNT">
			 	 		<input type="hidden" name="PRODUCT_BNO" value="${detail.PRODUCT_BNO}">
				 		<input type="hidden" name="PRODUCT_TITLE" value="${detail.PRODUCT_TITLE}">
				 		<input type="hidden" name="MEMBER_ID" value="test001">
				 	</div>
				 	<div>
				 		<button type="submit" class="btn btn-primary btn-lg py-3 btn-block">구매하기</button>
				 	</div>
		 		</form>
		 		<div class="detail-paddingTop-form detail-paddingBottom-jjim">
			 		<form action="insertFavorite">
				 		<input type="hidden" name="PRODUCT_BNO" value="${detail.PRODUCT_BNO}">
				 		<input type="hidden" name="FAVORITE_TITLE" value="${detail.PRODUCT_TITLE}">
				 		<input type="hidden" name="FAVORITE_CONTENT" value="${detail.PRODUCT_CONTENT}">
				 		<input type="hidden" name="FAVORITE_IMG" value="${detail.PRODUCT_IMG}">
				 		<input type="hidden" name="FAVORITE_PRICE" value="${detail.PRODUCT_PRICE}">
				 		<input type="hidden" name="MEMBER_ID" value="test001">
				 		<button type="submit" class="btn btn-primary btn-lg py-3 btn-block">찜 하기</button>
			 		</form>
		 		</div>
		 		<form action="insertOrder">
			 		<div class="detail-paddingBottom-form">
				 		<input type="hidden" name="PRODUCT_BNO" value="${detail.PRODUCT_BNO}">
				 		<input type="hidden" name="PRODUCT_TITLE" value="${detail.PRODUCT_TITLE}">
				 		<input type="hidden" name="MEMBER_ID" value="test001">
			 		</div>
			 		<div>
				 		<button type="submit" class="btn btn-primary btn-lg btn-block">장바구니</button>
			 		</div>
		 		</form>
		 	</div>
		</div>
		
		<div class="container detail-review-padding">
			<h2 class="detail-review-h2">리뷰</h2>
		</div>
		
		<table class="table table-hover container detail-table">
		  <thead>
		    <tr>
		      <th scope="col">작성자</th>
		      <th scope="col">내용</th>
		      <th scope="col">등록날짜</th>
		      <th scope="col">평점</th>
		      <th colspan="2"></th>
		    </tr>
		  </thead>
		  <c:forEach items="${reviewList}" var="reviewList">
		  <tbody>
		    <tr>
		      <td>${reviewList.REVIEW_WRITER}</td>
		      <td>${reviewList.REVIEW_CONTENT}</td>
		      <td>${reviewList.REVIEW_REGDATE}</td>
		      <td>${reviewList.PRODUCT_RATE}</td>
		      <td>
		      	<a href="updateReview?REVIEW_BNO=${reviewList.REVIEW_BNO}&PRODUCT_BNO=${reviewList.PRODUCT_BNO}">
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
		      	</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		      
			  	<a href="delete?REVIEW_BNO=${reviewList.REVIEW_BNO}&PRODUCT_BNO=${reviewList.PRODUCT_BNO}">
					<button type="submit" class="btn btn-primary btn-sm">삭제</button>
				</a>
		      </td>
		    </tr>
		  </tbody>
		  </c:forEach>
		</table>
		
	  	<div class="col-md-6">
            <div class="row mb-5">
            </div>   
          </div>
	</div>

	<!-- /.container -->
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>