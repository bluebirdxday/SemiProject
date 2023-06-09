<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="qna" value="${Qna}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_qnd_detail</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_qna_read.css">
</head>
<body>

    <ul class="admin_ul">
        <a href="/">
           <img class="homeLogo" src="/resources/src/img/LOGO.png">
        </a>
  
        <li class="admin_list"><a class="admid_notice" href="\admin\admin_notice">공지사항 관리</a></li>
        <li class="admin_list"><a class="admid_user" href="\admin\admin_user">회원 관리</a></li>
       <li class="admin_list"><a class="admid_board" href="\admin\admin_board">게시글 관리</a></li>
        <li class="admin_list"><a class="admid_qna" href="\admin\admin_qna">문의 관리</a></li>
    
    </ul>

    <!-- -------------------- -->

  <!-- ----------상단 제목---------- -->
  <div class="admin_qna_read_wrap">
    <span class="admin_qna_read_bar">문의 관리</span>
 <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
    <hr>
    <!-- 문의사항 테이블 -->
    <table class="admin_qna_read_table" border="1">
            <tr>
                <th>제목</th>
                <td>${qna.qnaTitle}</td>
            </tr>
            <tr>
                <th>번호</th>
                <td>${qna.qnaNo}</td>
            </tr>
            <tr>
                <th>문의유형</th>
                <c:if test="${qna.qnaCategory=='T'}" >
                    <td>거래신고</td>
                </c:if>
                <c:if test="${qna.qnaCategory=='U'}" >
                    <td>회원/계정</td>
                </c:if>
                <c:if test="${qna.qnaCategory=='E'}" >
                    <td>오류/제안</td>
                </c:if>
                <c:if test="${qna.qnaCategory=='C'}" >
                    <td>채팅/알람</td>
                </c:if>
                 <c:if test="${qna.qnaCategory=='O'}" >
                                <td>기타문의</td>
                </c:if>
            </tr>
            <tr>
                <th>회원번호</th>
                <td>${qna.userNo}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${qna.qnaEnrollDate}</td>
            </tr>
        </table>
        
       <!-- 글 읽어 오기 -->
            <div class="admin_qna_read_content">
                <div>${qna.qnaContent}</div>
            </div>
            
            <!-- 댓글기능 -->
            <div class="admin_qna_read_comment">
                <div>
                    112에 신고하세요...
                </div>
            </div>

            <div class="admin_qna_read_BtnWrap">
                <button class="admin_qna_read_Btn">답변 삭제</button>
                <button class="admin_qna_read_Btn">답변 수정</button>
                <button class="admin_qna_read_Btn">답변 등록</button>
                <button class="admin_qna_read_Btn" id="admin_qna_read_delete"><a href="/admin/admin_qna/${qna.qnaNo}/delete">삭제</button>
            </div>

   
            <script src="\resources\js\admin\admin_qna_read.js"></script>
</body>
</html>