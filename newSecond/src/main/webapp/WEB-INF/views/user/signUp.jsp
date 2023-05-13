<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>회원가입 페이지</title>

    <link rel="stylesheet" href="/resources/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="/resources/css/user/signUp.css">
</head>
<body>
    <div class="login-container">

        <div class="mb-5">
            <h2>회원 정보를 입력해주세요</h2>
        </div>

        <form action="/user/signUp" method="post" id="signUpFrm">
            

            <%-- 이메일 --%>
            <div class="input-container mb-4">

                <label for="userEmail">아이디(이메일)</label>
                
                <input type="text" id="userEmail" name="userEmail" placeholder="email@example.com" maxlength="30" autocomplete="off">

                <span class="signUp-message" id="emailMessage">로그인 및 메일 수신에 사용될 이메일을 입력해주세요</span>

            </div>

            <%-- 패스워드 --%>
            <div class="input--password__container mb-4">

                <label for="userPassword">비밀번호</label>

                <div class="input-container">
                    
                    <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20">
                    
                </div>

                <div class="input-container">
                    
                    <input type="password" id="userPasswordConfirm" name="userPasswordConfirm" placeholder="비밀번호 확인" maxlength="20">

                </div>

                <span class="signUp-message" id="passwordMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>

            </div>


            <%-- 닉네임 --%>
            <div class="input-container mb-4">

                <label for="userNickname">닉네임</label>

                <input type="text" id="userNickname" name="userNickname" placeholder="닉네임" maxlength="10" autocomplete="off">

                <span class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자</span>

            </div>


            <%-- 전화번호 --%>
            <div class="input-container mb-4">

                <label for="userTel">전화번호</label>
                
                <input type="text" id="userTel" name="userTel" placeholder="(- 없이 숫자만 입력)" maxlength="11">
                
                <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>

            </div>



            <%-- 주소 --%>
            <div class="input-container mb-4">

                <label for="userAddress">주소</label>

                <input type="text" id="userAddress" name="userAddress">
                
            </div>
            


            <div class="d-flex justify-content-center">

                <button type="submit" class="submit-button">가입하기</button>

            </div>

        </form>

    </div>
    <script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/user/signUp.js"></script>

</body>
</html>