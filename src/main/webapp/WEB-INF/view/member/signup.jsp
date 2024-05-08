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
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>
<%--div.container>div.row.justify-content-center>div.col-6--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <h3 class="mb-4">회원가입</h3>
            <form action="/member/signup" method="post">
                <%-- div*3>label.form-label+input.form-control--%>
                <div class="mb-4">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <input name="email" id="inputEmail" type="email" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label for="inputPassword" class="form-label">패스워드</label>
                    <input name="password" id="inputPassword" type="password" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label for="writer" class="form-label">사용자 이름</label>
                    <input name="writer" id="writer" type="text" class="form-control" required>
                </div>
                <div class="mb-4">
                    <button class="btn btn-primary">가입</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
