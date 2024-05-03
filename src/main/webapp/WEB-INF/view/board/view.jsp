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
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3>${board.id}번 게시물</h3>
            <div class="mb-3">
                <label for="inputTitle" class="form-label">
                    제목
                </label>
                <input id="inputTitle" class="form-control" type="text" value="${board.title}" readonly>
            </div>
            <div class="mb-3">
                <label for="textareaContent" class="form-label">
                    본문
                </label>
                <textarea id="textareaContent" class="form-control" cols="30" rows="10"
                          readonly>${board.content}</textarea>
            </div>
            <div class="mb-3">
                <label for="inputWriter" class="form-label">
                    작성자
                </label>
                <input id="inputWriter" class="form-control" type="text" readonly value="${board.writer}">
            </div>
            <div class="mb-3">
                <label for="inputInserted" class="form-label">
                    작성일시
                </label>
                <input id="inputInserted" class="form-control" type="datetime-local" readonly value="${board.inserted}">
            </div>

            <%--            로그인 한 사람 글일때만 보이게--%>
            <%--            로그인된 사용자의 id == 게시물의 memberId가 같으면--%>
            <%--            로그인 된 얻기--%>
            <sec:authorize access="isAuthenticated()">
                <%--                property의 property를 page영역의 member에 넣어놓고...--%>
                <%--                로그인 된 사용자 얻기--%>
                <sec:authentication property="principal.member" var="member"/>
                <c:if test="${member.id eq board.memberId}">

                    <div class="mb-3">
                        <button form="formDelete" class="btn btn-danger">삭제</button>
                        <a href="/modify?id=${board.id}" class="btn btn-secondary">수정</a>
                    </div>

                </c:if>
            </sec:authorize>
        </div>


    </div>
</div>

<%--누군가 소스보기에서 볼 수 없게 authorize 주기--%>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member"/>
    <c:if test="${member.id eq board.memberId}">

        <div style="display: none">
            <form id="formDelete" action="/delete" method="post" onsubmit="return confirm('삭제하시겠습니까?')">
                <input type="hidden" name="id" value="${board.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
