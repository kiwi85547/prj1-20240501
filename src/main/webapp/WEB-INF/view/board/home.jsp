<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, th, tr, td {
            border-collapse: collapse;
            border: 1px solid black;
            padding: 5px;
        }

        th {
            background-color: mediumseagreen;
        }

        td:nth-child(2) {
            padding-right: 100px;
        }
    </style>
</head>
<body>
<h3>게시물 목록</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <%--        todo : 게시물의 제목을 클릭하면 해당 게시물로 이동하도록 수정--%>
        <tr>
            <td>${board.id}
            </td>
            <td>
                <a href="board?id=${board.id}">${board.title}</a>
            </td>
            <td>${board.writer}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
