<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="mb-4">이메일
                <input name="email" value="${member.email}" type="email" class="form-control" readonly>
            </div>
            <div class="mb-4">패스워드
                <input name="password" value="${member.password}" type="password" class="form-control" readonly>
            </div>
            <div class="mb-4">사용자 이름
                <input name="writer" value="${member.writer}" type="text" class="form-control" readonly>
            </div>
            <div class="mb-4">가입 일시
                <input name="inserted" value="${member.inserted}" type="datetime-local" class="form-control" readonly>
            </div>
            <div>
                <input type="hidden" name="id" value="${member.id}">
            </div>
            <div>
                <a href="/member/modify?id=${member.id}" class="btn btn-primary">수정</a>
                <form action="/member/delete" method="post">
                    <input type="hidden" name="id" value="${member.id}">
                    <button class="btn btn-danger">탈퇴</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%--실행 안됨.... 뭘까??--%>
<%--<c:if test="${not empty message}">--%>
<%--    <div>${message}</div>--%>
<%--    <script>--%>
<%--        alert("${message}");--%>
<%--    </script>--%>
<%--</c:if>--%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
