<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">PROJECT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <%--                로그인 되었을 때 --%>
                <sec:authorize access="isAuthenticated()">
                    <div class="mb-2">로그인 되었습니다</div>
                </sec:authorize>
                <li class="nav-item">
                    <a href="/boardList" class="nav-link">
                        게시물 목록
                    </a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/add" class="nav-link">
                            글쓰기
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="not isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/signup" class="nav-link">
                            회원가입
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/list" class="nav-link">
                            회원목록
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="not isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/login" class="nav-link">
                            로그인
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/logout" class="nav-link">
                            로그아웃
                        </a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
