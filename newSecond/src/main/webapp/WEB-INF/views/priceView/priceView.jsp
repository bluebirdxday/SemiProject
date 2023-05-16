<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/priceView/priceView.css">
    <title>New Second</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <div class="content--priceView__background">
        <section class="content--priceView__top">
            <div class="content--priceView__title">시세조회</div>
        </section>

        <section class="content--priceView__main">
            <aside class="content--aside__left"></aside>

            <section class="priceView--background">
                <!-- mainFrame -->
                <div class="priceView--main__box">
                    <div class="priceView--main__leftBox">
                        <div class="priceView--main__searchBox">
                            <div>
                                <input type="text" placeholder="검색어를 입력하세요" maxlength="30"><button type="submit">검색</button>
                            </div>
                        </div>

                        <!--  -->

                        <div class="priceView--main__recentSearch">
                            <div>
                                <div>최근 시세조회한 검색어</div><button type="button">모두 지우기</button>
                            </div>
                            <div>
                                <span>아이폰</span>
                                <span>아이패드</span>
                                <span>아이폰12</span>
                                <span>아이폰se2</span>
                            </div>
                        </div>
                    </div>

                    <!-- 좌우분할 -->

                    <div class="priceView--main__popularSearch">
                        <span>시세조회 인기검색어</span>
                        <ol>
                            <li>아이폰14</li>
                            <li>갤럭시S22</li>
                            <li>애플워치4</li>
                            <li>갤럭시버즈</li>
                            <li>에어팟</li>
                            <li>맥북에어</li>
                            <li>영화티켓</li>
                            <li>의자</li>
                            <li>커블체어</li>
                            <li>슬램덩크</li>
                        </ol>
                    </div>

                </div>
                <!-- mainFrame -->
            </section>

            <aside class="content--aside__right"></aside>
        </section>
    </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <a href="/priceView/priceViewResult">
        <button>시세조회결과테스트버튼입니다</button>
    </a>
    <a href="/chatting/chatting">
        <button>채팅테스트버튼입니다</button>
    </a>

    <script src="/resources/js/priceView/priceView.js"></script>
</body>
</html>