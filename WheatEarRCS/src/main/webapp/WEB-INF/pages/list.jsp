<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/17 0017
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>list</h1>
    ${list}

    <c:forEach items="${list}" var="li">
        ${li.name}
    </c:forEach>
</body>
</html>
