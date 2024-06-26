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
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 정보</h3>
            <%--                        div>div.mb-4*4>label.form-label+input[readonly].form-control--%>
            <div>
                <div class="mb-4">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <input value="${member.email}" id="inputEmail" type="text" readonly="" class="form-control">
                </div>
                <div class="mb-4">
                    <label for="inputPassword" class="form-label">패스워드</label>
                    <input value="${member.password}" id="inputPassword" type="text" readonly="" class="form-control">
                </div>
                <div class="mb-4">
                    <label for="inputNickName" class="form-label">닉네임</label>
                    <input value="${member.nickName}" id="inputNickName" type="text" readonly="" class="form-control">
                </div>
                <div class="mb-4">
                    <label for="inputInserted" class="form-label">가입일시</label>
                    <input value="${member.inserted}" id="inputInserted" type="text" readonly="" class="form-control">
                </div>

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.member" var="authMember"/>
                    <c:if test="${authMember.id eq member.id}">
                        <div>
                                <%--                    button.btn.btn-danger[form]{탈퇴}--%>
                            <button class="btn btn-danger" form="formDelete">탈퇴</button>
                            <a href="/member/modify?id=${member.id}" class="btn btn-secondary">정보 수정</a>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>
<%--div.d-none>form>input:h[name=id]--%>
<%--form의 id를 위쪽 button의 form에 넣기--%>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div class="d-none" onsubmit="return confirm('탈퇴하시겠습니까?')">
            <form action="/member/remove" id="formDelete" method="post">
                <input type="hidden" name="id" value="${member.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
