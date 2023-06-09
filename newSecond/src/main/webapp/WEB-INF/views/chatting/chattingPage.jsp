<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/chatting/chatting.css">
    <title>New Second</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <div class="content--chatting__background">
        <section class="content--chatting__top">
            <div class="content--chatting__title">채팅</div>
        </section>

        <section class="content--chatting__main">
            <aside class="content--aside__left"></aside>

            <section class="chatting--background">
                <!-- mainFrame -->
                <div class="chatting--main__box">
                    <div class="chatting--main__leftBox">
                        <div>
                            <img src="#">
                            <div>당산동아이유</div>
                        </div>
                        <div class="chatting--leftBox__profileList">
                            <div class="chatting--leftBox__scroll">
                                <div>
                                    <img src="#">
                                    <div>피자배달부키키</div>
                                    <div>인케이스 사고 싶어요!</div>
                                </div>
                                <div>
                                    <img src="#">
                                    <div>내가만든쿠키</div>
                                    <div>네고 가능한가요?</div>
                                </div>
                                <div>
                                    <img src="#">
                                    <div>#USER01433</div>
                                    <div>감사합니다~</div>
                                </div>
                                <div>
                                    <img src="#">
                                    <div>다크나이트</div>
                                    <div>안녕하세요</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 좌우분할 -->

                    <div class="chatting--main__rightBox">
                        <div class="chatting--rightBox__post">
                            <div><img src="#"></div>
                            <div><a href="#">인케이스 15인치 가방 싸게 팝니다</a></div>
                        </div>

                        <div class="chatting--rightBox__chatList">
                            <div class="chatting--rightBox__scroll">
                                <div>안녕하세요!</div>
                                <div>인케이스 가방 팔렸나요?</div>
                                <span>아직 안 팔렸습니다 ^^</span>
                                <div>아 그런가요?</div>
                                <span>네 어디 사세요?</span>
                                <span>직거래입니다</span>
                                <div>저는 건대 후문 사는데요</div>
                                <span>아 건대 후문이면 가능하겠네요</span>
                            </div>
                        </div>

                        <div class="chatting--rightBox__chatInput">
                            <input type="text">
                            <button type="submit">전송</button>
                        </div>
                    </div>
                    
                </div>
                <!-- mainFrame -->
            </section>

            <aside class="content--aside__right"></aside>
        </section>
    </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/chatting/chatting.js"></script>
    
</body>
</html>