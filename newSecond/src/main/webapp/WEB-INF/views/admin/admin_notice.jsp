<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_notice</title>
   <link rel="stylesheet" href="\resources\css\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin_notice.css">
</head>
<body>

    <ul class="admin_ul">
        <a href="/">
            <img src="../src/img/LOGO.png" alt="로고" id="homeLogo">
        </a>
     
        <li class="admin_list"><a class="admid_notice" href="\admin\admin_notice">공지사항 관리</a></li>
         <li class="admin_list"><a class="admid_user" href="\admin\admin_user">회원 관리</a></li>
        <li class="admin_list"><a class="admid_board" href="\admin\admin_board">게시글 관리</a></li>
         <li class="admin_list"><a class="admid_qna" href="\admin\admin_qna">문의 관리</a></li>
    </ul>

    <!-- ----------상단 제목---------- -->
    <span class="amdmin_notice_logout">로그아웃</span>

    <div class="admin_notice_wrap">
        <span class="admin_notice_bar">공지사항 관리</span>
     <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
        <hr>

        <!-- 선택 숨김,삭제 버튼 -->
        
        <div class="admin_notice_Btn">
            <button class="admin_notice_HiddenBtn">선택 숨김</button>
            <button class="admin_notice_DelBtn">선택 삭제</button>
        </div>


        
        <!-- ----테이블------ -->
        <div class="admin_notice_tableWrap">
        <table class="admin_notice_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" name="" id=""></th>
                <th >번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th colspan="2">수정</th>
            </thead>
            </tr>
            <tbody>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>1</td>
                <td>뉴세컨마켓 사용 가이드</td>
                <td>2023.04.20</td>
                <td>220</td>
                <td>
                <button class="admin_notice_tableBtn">내용 수정</button>
                </td>
                <td>
                <button class="admin_notice_tableBtn">필독 취소</button>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>1</td>
                <td>bungae</td>
                <td>정상</td>
                <td>2022.10.01</td>
                <td>
                    <button class="admin_notice_tableBtn">공지 복구</button>
                    </td>
                    <td>
                    <button class="admin_notice_tableBtn">필독 등록</button>
                    </td>
            </tr>
        </tbody>
        </table>
    </div>

    </div>

<script src="\resources\js\admin_notice.js"></script>
</body>
</html>