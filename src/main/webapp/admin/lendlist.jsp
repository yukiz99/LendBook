<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>借还日志</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style>
    
         .alert{
           width:20%;
          margin-left:35%
        }
    </style>
    <script>
        $(function () {
            $('#header').load('/admin/header.html');
        })
    </script>
</head>
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">


<div id="header"></div>

<div style="position: relative;padding-top: 100px">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>

     <div class="container col-sm-8 col-sm-offset-2">
          <table class="table table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>图书号</th>
                <th>图书名</th>
                <th>读者证号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="lend">
                <tr>
                    <td>${lend.serNum}</td>
                    <td>${lend.bookId}</td>
                    <td>${lend.book.name}</td>
                    <td>${lend.readerId}</td>
                    <td><fmt:formatDate value="${lend.lendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${lend.backDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a href="/admin/deletelend.html?serNum=${lend.serNum}">
                            <c:if test="${!empty lend.backDate}">
                                <button type="button" class="btn btn-danger">删除</button>
                            </c:if>
                            <c:if test="${empty lend.backDate}">
                                <button type="button" class="btn btn-default" disabled="disabled">删除</button>
                            </c:if>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
     </div>   

</body>
</html>
