<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="TeamBee, Market, TeamBee-Market, 마켓, 팀비, 몰" />
        <meta name="author" content="TeamBee" />
        <title>TeamBee Market</title>
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/login.css" rel="stylesheet" />
        <!-- 
        <link rel="stylesheet" href="resources/css/common.css" rel="stylesheet" type="text/css"/> 
         -->
    </head>
    <body id="page-top" class="h-100">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index">TeamBee Market</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">카테고리</a>
                        	<div class="dropdown-menu dropdown-menu-left">
                        		
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=tv">TV</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=refrigerator">냉장고</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=washer">세탁기</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=dryer">건조기</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=appliances">주방가전</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=computer">컴퓨터</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=camera">카메라</a>
								<a class="dropdown-item dropdown-item_a" href="category?PRODUCT_TYPE=phone">휴대폰</a>
                        		
							</div>
                        </li>
                       <c:if test="${member.MEMBER_ID=='admin' }">
	                        <li class="nav-item dropdown">
	                        	<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">관리페이지</a>
	                        	<div class="dropdown-menu dropdown-menu-left">
	                        		
									<a class="dropdown-item dropdown-item_a" href="memberList">회원관리</a>
									<a class="dropdown-item dropdown-item_a" href="insert">상품등록</a>
									<a class="dropdown-item dropdown-item_a" href="orderList">배송관리</a>					
	                        		
								</div>
	                        </li>
                        </c:if>
                        
                        <c:if test="${member.MEMBER_ID!=null }">
                        	<c:if test="${member.MEMBER_ID!='admin' }">
		                        <li class="nav-item dropdown">
		                        	<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">마이페이지</a>
		                        	<div class="dropdown-menu dropdown-menu-left">
		                        		
											<a class="dropdown-item dropdown-item_a" href="update?MEMBER_ID=${member.MEMBER_ID}">정보수정</a>
											<a class="dropdown-item dropdown-item_a" href="favoriteList?MEMBER_ID=${member.MEMBER_ID}">찜 리스트</a>
											<a class="dropdown-item dropdown-item_a" href="orderListForMember?MEMBER_ID=${member.MEMBER_ID }">주문목록</a>					
		                        		
									</div>
		                        </li>
	                        </c:if>
                        </c:if>
                         <c:if test="${member.MEMBER_ID!=null }">
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="cart?MEMBER_ID=${member.MEMBER_ID}">장바구니</a></li>
                        </c:if>
                        <li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">고객센터</a>
                        	<div class="dropdown-menu dropdown-menu-left">
                        		
									<a class="dropdown-item dropdown-item_a" href="noticeList">공지사항</a>
									<a class="dropdown-item dropdown-item_a" href="qna">Q&A</a>						
                        		
							</div>
                        </li>
                        <c:choose>
	                        <c:when test="${member.MEMBER_ID==null}">
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="login">로그인</a></li>
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="join">회원가입</a></li>
	                        </c:when>
	                        
	                        <c:when test="${member.MEMBER_ID!=null}">
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger">${member.MEMBER_ID}님 환영합니다</a></li>
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="logOut">로그아웃</a></li>
	                        </c:when>
	                        
	                    </c:choose>
                    </ul>
                </div>
            </div>
        </nav>