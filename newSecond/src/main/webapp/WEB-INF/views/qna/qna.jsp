<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna copy</title>

    <style>
        @import url('https://fonts.googleapis.com/icon?family=Material+Icons');
    </style>

    <link rel="stylesheet" href="/web/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/web/src/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="/resources/css/qna.css">


</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
  <!-- 제목 바 -->
        <div class="qna_bar_container" style =" background-color:#8ab2e24b"> 
            <div class="qna_bar">1:1 문의</div>
    </div>  
<!-- 문의하기 드랍 및 내용  -->
    <div class="qna_container">
    <div class="qna_dropdown">
        <button class="qna_dropbtn">
          <span class="qna_dropbtn_content">문의 게시판</span>
          <span class="qna_dropbtn_click" style="font-family: Material Icons; font-size : 30px; color :  #005EEE; float:right;"
            onclick="dropdown()">arrow_drop_down</span>
        </button>
        <div class="qna_dropdown-content">
          <div class="qnaList" onclick="showMenu(this.innerText)">거래신고</div>
          <div class="qnaList" onclick="showMenu(this.innerText)">회원/계정</div>
          <div class="qnaList" onclick="showMenu(this.innerText)">오류/제안</div>
          <div class="qnaList" onclick="showMenu(this.innerText)">채팅/알람</div>
        </div>
      </div>

      <div class="qna_content">
        <textarea name="" id="qna_content" cols="88" rows="20" 
        style="resize: none;" placeholder="  문의내용"></textarea>
    </div>
    
    
        <button class="qna_photo_btn">
          <input type="file" name="" class="qna_photo"><span></span>
          
   
</div>

<!-- 문의하기 버튼 -->
    <form action="" >
      <div id="qna_button_wrap">
     <button id="qna_button"><a href="\qna\qna_check">문의 하기</a></button>
    </div>
    </form>
    

<!-- 모달 창 -->

    <div id="qna_modal">
        <div id="qna_modal_body">
          <span id="qna_closeBtn">&times;</span>
          <p>문의하신 내용이 접수되었습니다.</p>
      </div>
    </div>
   


  
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/qna.js"></script>
    

</body>
</html>