<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>我的借还</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
    <style>
       .container{
         padding-top:100px;
       }
    </style>
<script>
        $(function () {
            $('#header').load('/reader/header.html');
        })
 </script> 
</head>
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;background-attachment: fixed;">
<div id="header"></div>

 <div class="container col-sm-7 col-sm-offset-2">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>图书名</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="lend">
                <tr>
                    <td>${lend.bookId}</td>
                    <td>${lend.book.name}</td>
                    <td><fmt:formatDate value="${lend.lendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${lend.backDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:if test="${empty lend.backDate}">
                        <td>未还</td>
                    </c:if>
                    <c:if test="${!empty lend.backDate}">
                        <td>已还</td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>

</div>
</body>
</html>
