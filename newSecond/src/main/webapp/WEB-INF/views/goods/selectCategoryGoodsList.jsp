<!--[서지영] 검색 목록 페이지 - 검색 기능, 검색 목록 기능별 조회, 더보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/goods/selectCategoryGoodsList.css">

</head>


<%-- 지영님의 list검색 copy임 --%>

<body style="overflow: auto;">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- content 내용 부분 -->
        <div class="container--outer">
            <!--  -->
            <div class="container--inner">
                <!-- 목록건수, 판매완료상품제외, 기능별조회 -->
                <div class="container--inner__top">
                        <div class="searchNameCount">${categoryName}</div>
                    <!-- 판매완료상품제외 -->
                    <%-- <div><input type="checkbox" class="soldoutExcept" id="check1">
                        <label for="check1"> 판매 완료 상품 제외</label>
                    </div> --%>
                    <!-- 기능별 조회 -->
                    <div class="selectSort">
                        <span id="selecSortRecent">최신순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortRowPrice">낮은가격순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortHighPrice">높은가격순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortFamous">인기순</span>
                    </div>
                </div>
                <c:choose>
                    <%-- 해당 검색 결과 없다면 --%>
                    <c:when test="${empty categoryGoodsList}">
                        <div class="container--inner__middle_noList">
                            <div class="noGoodsList">카테고리에 있는 상품이 없습니다.</div>
                        </div>
                    </c:when>
                        
                    <%-- 해당 검색 결과 있다면 --%>
                    <c:otherwise>
                        <div class="container--inner__middle" id="goodsListTable">
                            <c:forEach items="${categoryGoodsList}" var="Goods" begin="0" end="11">
                            <div class="goods">
                                <a href="/goods/${Goods.goodsNo}">
                                <%-- 썸네일 --%>
                                <c:choose>
                                    <c:when test="${not empty Goods.thumbnail}">
                                        <img src="${Goods.thumbnail}" 
                                        onerror="this.src='/resources/src/img/no_image.jpeg'"
                                        >
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/src/img/no_image.jpeg">
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${Goods.goodsStatus=='E'}" >
                                    <div class="status soldout">
                                        Sold Out
                                    </div>
                                </c:if>
                                <c:if test="${Goods.goodsStatus=='C'}" >
                                    <div class="status reserved">
                                        Reserved
                                    </div>
                                </c:if>
                                <div class="goods_price"><fmt:formatNumber value="${Goods.goodsPrice}" pattern="##,###,###"/></div>
                                <div class="goods_title">${Goods.goodsTitle}</div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- 더보기 버튼-->
                <c:choose>
                    <c:when test="${fn:length(categoryGoodsList) gt 12}">
                        <div class="container--inner__bottom">
                            <button class="more" id="viewMoreGoods">MORE</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="container--inner__bottom" style="display:none">
                            <button class="more" id="viewMoreGoods">MORE</button>
                        </div>
                    </c:otherwise>
                </c:choose> 
            </div>

            <c:if test="${not empty loginUser}" >
				<a href="/writing/write">
					<div class="myshop--btn__fixed-addpost">
						<img src="/resources/src/img/addPost.png">
					</div>
				</a>
			</c:if>


        </div>


        <script>
            const categoryCode = ${categoryNo};
        </script>
        
        <script src="/resources/js/goods/moreCategoryGoods.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>