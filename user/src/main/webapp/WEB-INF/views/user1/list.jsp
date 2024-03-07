<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>user1::list</title>
</head>
<body>
    <h3>user1 목록</h3>
    <a href="/">메인</a>
    <a href="/user1/register">등록</a>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>나이</th>
                <th>관리</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.hp}</td>
                    <td>${user.age}</td>
                    <td>
                        <a href="/user1/modify?id=${user.id}">수정</a>
                        <a href="/user1/delete?id=${user.id}">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
</body>
</html>
