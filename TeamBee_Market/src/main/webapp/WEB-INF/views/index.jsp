<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="resources/assets/img/galaxynote20.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="resources/assets/img/apple.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="resources/assets/img/samsungtv.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        <section class="page-section bg-light" id="portfolio">
            <div class="container" style="overflow:hidden">
            	<div class="search form-inline" style="float:right;">
				    <select name="searchType" class="form-control">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				    </select>
			
				    <input type="text" class="form-control" name="keyword" id="keywordInput" value="${scri.keyword}"/>
				
				    <button id="searchBtn" class="btn btn-primary" type="button">검색</button>
				  	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
					<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
					<script>
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      });   
				    </script>
  				</div>
             
  				
            	<div>
            		<br><br>
            	</div>
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">오늘의 추천</h2>
                    <h3 class="section-subheading text-muted">TeamBee 가전제품</h3>

                </div>
                <div class="row">
					<c:forEach items="${list}" var="list">
		                    <div class="col-lg-3 col-sm-6 mb-4 index-content-width">
		                        <div class="portfolio-item">
		                            <a class="portfolio-link" href="detail?PRODUCT_BNO=${list.PRODUCT_BNO}" data-toggle="modal">
		                                <div class="portfolio-hover">
		                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
		                                </div>
		                               <a href="detail?PRODUCT_BNO=${list.PRODUCT_BNO}"><img class="img-fluid index_image_size" src="${list.PRODUCT_IMG}" alt="상품이미지" /></a>
		                            </a>
		                            <div class="portfolio-caption">
		                                <div class="portfolio-caption-heading">	${list.PRODUCT_TITLE}</div>
		                                <div class="portfolio-caption-subheading text-muted"> <fmt:formatNumber pattern="###,###,###" value="${list.PRODUCT_PRICE}" />원</div>
		                            </div>
		                        </div>
		                    </div>       
		            </c:forEach>
                </div>
            </div>
           
                <!-- Pagination -->
  <ul class="pagination justify-content-center">	  
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
        </section>
    
       
        <!-- Team-->
        
        <!-- Clients-->
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="resources/assets/img/logos/samsung.jpg" alt="삼성로고" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="resources/assets/img/logos/cucu.png" alt="쿠쿠로고" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="resources/assets/img/logos/lg.jpg" alt="엘지로고" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="resources/assets/img/logos/logitech.jpg" alt="로지텍로고" /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact-->
        
        <!-- Footer-->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
        
    </body>
</html>
