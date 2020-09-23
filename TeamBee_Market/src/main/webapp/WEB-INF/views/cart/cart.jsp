<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  
  
  
  <div class="wrap_auto">
    

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">장바구니</strong></div>
        </div>
      </div>
    </div>
      <br>
    

    <div class="site-section">
      <div class="container cart-margin-top">
      <c:choose>
      	<c:when test="${map.count == 0}">
      		<p>장바구니가 비어있습니다.</p>
      	</c:when>
      	<c:otherwise>
          <form name="form1" id="form1" class="col-md-12" action="purchaseCart">
        <div class="row mb-5">
            <div class="site-blocks-table cart-table-width100">
              <table class="table table-bordered cart-table">
                <thead>
                  <tr>
                    <th class="product-check"><input type="checkbox" name="allCheck" id="allCheck" checked/></th>
                    <th class="product-thumbnail">이미지</th>
                    <th class="product-name">상품</th>
                    <th class="product-price">가격</th>
                    <th class="product-quantity">수량</th>
                    <th class="product-total">구매가격</th>
                    <th class="product-remove">삭제</th>
                  </tr>
                </thead>
                <c:forEach var="row" items="${map.list}" varStatus="i">
                <tbody>
                  <tr>
                  	<td>
                  		<input type="checkbox" name="PRODUCT_BNO" class="chkbox" id="blankCheckbox" value="${row.PRODUCT_BNO}" checked/>
                  	</td>
                    <td class="product-thumbnail">
                      <img src="${row.PRODUCT_IMG}" alt="상품" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">${row.PRODUCT_TITLE}</h2>
					  <input type="hidden" name="PRODUCT_TITLE" value="${row.PRODUCT_TITLE}">
                    </td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${row.PRODUCT_PRICE}" /></td>
                    <td>
                      <div class="input-group mb-3" style="max-width: 120px;">
                        <div class="input-group-prepend">
                        
                          <button class="btn btn-outline-primary js-btn-minus" type="button" onclick="location.href='decreaseCart?PRODUCT_BNO=${row.PRODUCT_BNO}&MEMBER_ID=${member.MEMBER_ID }'">&minus;</button>
                         
                        </div>
		                        <input type="text" class="form-control text-center" name="ORDER_AMOUNT" value="${row.AMOUNT}"  aria-label="Example text with button addon" aria-describedby="button-addon1" />
		                        
                        <div class="input-group-append">
		                     
                          <button class="btn btn-outline-primary js-btn-plus" type="button" onclick="location.href='increaseCart?PRODUCT_BNO=${row.PRODUCT_BNO}&MEMBER_ID=${member.MEMBER_ID }'">&plus;</button>
                         
                        </div>
                      </div>

                    </td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${row.MONEY}" /></td>
                    <td><a href="deleteCart?CART_BNO=${row.CART_BNO}&MEMBER_ID=${member.MEMBER_ID}"class="btn btn-primary btn-sm">X</a></td>
                  </tr>
                </tbody>
                </c:forEach>
              </table>
            </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                
              </div>
              <div class="col-md-6">
                
              </div>
            </div>
            
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">장바구니 총 금액</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">장바구니  합계:</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black"><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/></strong>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">배송료:</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">${map.fee}</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">전체 주문금액:</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black"><fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/></strong>
                  </div>
                </div>

                <div class="row">
                	<input type="hidden" name="MEMBER_ID" value="${member.MEMBER_ID }"/>
                	<input type="hidden" name="CART_BNO" value="${row.CART_BNO}"/>
                  <div class="col-md-12 cart-subBtn">
                    <button class="btn btn-primary btn-lg py-3 btn-block" type="submit">결제하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <input type="hidden" name="count" value="${map.count}">
          </form>
      	</c:otherwise>
    </c:choose>
      </div>
    </div>

  </div>
  <br>
    <%@include file="/WEB-INF/views/include/footer.jsp"%>

 <!-- 
	<script>
		function fnCalCount(type, ths){
			var $input = $(ths).parents("div").find("input[name='amount']");
			var tCount = Number($input.val());
			
			if(type=="p"){
				$input.val(Number(tCount)+1);
			}else{
				if(tCount>1) $input.val(Number(tCount)-1);
			}
		}
	</script>
  -->

 <!-- 체크박스 관련 자바스크립트 -->
 <script>
 //전체선택
	 $("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	     $(".chkbox").prop("checked", true);
	     //itemSum();
	 } else {
	      $(".chkbox").prop("checked", false);
	    //itemSum();
	 }
	});

// 체크박스를 하나라도 풀면 전체선택 체크박스를 푸는 스크립트

       $(".chkbox").click(function(){
        $("#allCheck").prop("checked", false);
        
      });

//체크박스 개별 선택
$(".chkbox").click(function() {
    var is_checked = true;
    
    $(".chkbox").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });
    
    $("#allCheck").prop("checked", is_checked);
});
</script>


 
 

    
  </body>
</html>