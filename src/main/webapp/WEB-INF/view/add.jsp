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
<form action="/add" method="post">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <h3 class="mb-4">게시물 작성</h3>
                <div class="mb-3">
                    <label for="inputTitle" class="form-label">제목</label>
                    <input name="title" id="inputTitle" type="text" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="textareaContent" class="form-label">본문</label>
                    <textarea name="content" id="textareaContent" class="form-control" cols="30" rows="10"
                              required></textarea>
                </div>

                <%--                <div class="mb-2">--%>
                <%--                    <label for="inputWriter" class="form-label">작성자</label>--%>
                <%--                    <input name="writer" id="inputWriter" type="text" class="form-control" required>--%>
                <%--                </div>--%>
                <%--                <div class="mb-2">--%>
                <%--                    <label for="inputMemberId" class="form-label">멤버아이디</label>--%>
                <%--                    <input name="memberId" id="inputMemberId" type="number" class="form-control" required>--%>
                <%--                </div>--%>
                <div class="mb-3">
                    <button class="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
