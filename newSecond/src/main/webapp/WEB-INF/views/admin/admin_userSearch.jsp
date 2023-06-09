<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="UserList" value="${UserList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_user</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_user.css">

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

    <!-- -------------------- -->
  

    <div class="admin_user_wrap">
        <div class="admin_user_bar">회원관리</div>
        <hr>
        <div >
            <span>
            <form action="/admin/admin_user/search" method="get">
                <input class="admin_user_search" type="text" name="search" id="" >${param.search}
            </span>
            <span>
                <button  class="admin_user_searchBtn">회원 정보 조회</button>
            </span>
           
        </div>
        <%-- Radio --%>
        <div class="admin_user_raidos">
            <span>
            <label ><input type="radio" name="admin_user_raidos" id="all">전체</label>
            <label ><input type="radio" name="admin_user_raidos" id="normal">정상</label>
            <label ><input type="radio" name="admin_user_raidos" id="block">블락</label>
            <label ><input type="radio" name="admin_user_raidos" id="signOut">탈퇴</label>
   
 
        </span>
        </div>
    <div class="admin_user_result">
        <span >검색결과 : </span> 
            <span class="admin_user_countOne">3</span>
            <span>/ 총</span>
            <span class="admin_user_countAll">3</span>
            <span>명</span>
        </div>
        
        <div class="admin_user_tableWrap">
        <table class="admin_user_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" class="admin_user_checkboxAll" name="" id="" value='selectall'
                    onclick='userSelectAll(this)'></th>
                <th >번호</th>
                <th>아이디</th>
                <th>상태</th>
                <th>가입일</th>
                <th colspan="2">관리</th>
            </thead>
            </tr>
            <tbody>
            <c:choose>
                <c:when test="${empty userSelectList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${userSelectList}" var="User">
                        <tr>
                        <td><input type="checkbox" class="admin_user_checkbox" name="" id=""></td>
                            <td class="admin_user_checkbox_no">${User.userNo}</td>
                            <td>${User.userEmail}</td>
                            <td class="admin_user_states">${User.userStatus}</td>
                            <td>${User.enrollDate}</td>
                          <td>

                          <input type="hidden" value="${User.userNo}" class="signOutUserNo">
                            <button class="admin_user_tableBtn forcedsignOut show" id="forcedsignOut">강제탈퇴</button>
                            <button class="admin_user_tableBtn signOutH" id="signOutH">탈퇴해제</button>
                            </td>
                            <td>
                            <button class="admin_user_tableBtn block show" id="block">회원블락</button>
                            <button class="admin_user_tableBtn blockH" id="blockH">블락해제</button>
                            </td>
                            </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            
        </tbody>
        </table>
    </div>

    </div>
 </form>

<script src="\resources\js\admin\admin_user.js"></script>

</body>
</html>