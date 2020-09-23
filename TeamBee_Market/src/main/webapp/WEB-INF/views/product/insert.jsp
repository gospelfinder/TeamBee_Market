<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  <div class="wrap_auto">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
          	<strong class="text-black">상품등록</strong>
          </div>
        </div>
      </div>
    </div>
	
    
      <div class="container insert-container-margin">
			<form action="upload" method="post" class="insert-form" enctype="multipart/form-data">
				<div class="form-group row">
					<label for="gdsImg" class="col-sm-2 control-label">상품이미지</label>
					<div class="col-sm-10">					
       					<input type="file" class="insert-file-input" name="file" id="gdsImg">
       					<input type="submit" class="insert-file-btn" value="업로드">    
					</div>
					
				</div>
  			</form>

        	<form action="insert" method="post" class="insert-form" enctype="multipart/form-data">
	        	<div class="form-group row">
	        	<label for="member_Id" class="col-sm-2 control-label">분류</label>
						<div class="col-sm-10">
	                  		<select name="PRODUCT_TYPE" class="form-control">
							    <option value="">-------------------</option>
							    <option value="tv">TV</option>
							    <option value="refrigerator">냉장고</option>
							    <option value="washer">세탁기</option>
							    <option value="dryer">건조기</option>
							    <option value="appliances">주방가전</option>
							    <option value="computer">컴퓨터</option>
							    <option value="camera">카메라</option>
							    <option value="phone">휴대폰</option>
							</select>
	             	    </div>
	             </div>
	                  	
	             <div class="form-group row">
		        	<label for="member_Id" class="col-sm-2 control-label">상품명</label>
		        	<div class="col-sm-10 product-thumbnail">
		        		<input type="text" name="PRODUCT_TITLE" class="form-control">
	        		</div>
	        	 </div>    
	        	 
	        	 <div class="form-group row">
	        	 	<label for="member_Id" class="col-sm-2 control-label">가격</label>
	        	 	<div class="col-sm-10 product-price">
	        	 		<input type="text" name="PRODUCT_PRICE" class="form-control">
	        	 	</div>
	        	 </div>
	        	 
	        	 <div class="form-group row">
	        	 	<label for="member_Id" class="col-sm-2 control-label">수량</label>
	        	 	<div class="col-sm-10 product-check">
	        	 		<input type="number" name="PRODUCT_AMOUNT" class="form-control">
	                    <input type="hidden" name="PRODUCT_IMG" value="/img/${savedName}"/>
	        	 	</div>	
	        	 </div>
	        	  	
				 <div class="form-group row">
				 	<label for="member_Id" class="col-sm-2 control-label">상품소개</label>
				 	<div class="col-sm-10 product-name">
				 		<textarea id="summernote" name="PRODUCT_CONTENT"></textarea>
				 	</div>
				 </div>
	            <div class="form-group row">
        			<button class="btn btn-primary btn-lg py-3 btn-block insert-btn" type="submit">상품등록</button>
    		    </div>
	 	   	</form>
      </div>
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