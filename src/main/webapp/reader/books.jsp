<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
      <style>
       #searchform{
         margin-top:70px;
       }
        .alert{
           width:20%;
          margin-left:35%
        }
    </style>
    <script>
        $(function () {
            $('#header').load('/reader/header.html');
        })
    </script>
</head>
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div class="container">
    <form method="get" action="/reader/querybook.html" class="form-inline" id="searchform">
        <div class="input-group">
            <input type="text" placeholder="图书名/作者" class="form-control" id="search" name="searchWord"
                   class="form-control">
            <span class="input-group-btn">
                <input type="submit" value="搜索" class="btn btn-info">
            </span>
   </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>
<div style="position: relative;top: 10%">
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
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>剩余数量</th>
                <th>借还</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="book">
                <tr>
                    <td><c:out value="${book.name}"></c:out></td>
                    <td><c:out value="${book.author}"></c:out></td>
                    <td><c:out value="${book.publish}"></c:out></td>
                    <td><c:out value="${book.isbn}"></c:out></td>
                    <td><c:out value="${book.number}"></c:out></td>

                    <c:set var="flag" value="false"/>
                    <c:forEach var="lend" items="${myLendList}">
                        <c:if test="${lend eq book.bookId}">
                            <c:set var="flag" value="true"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${flag}">
                        <td><a href="/reader/returnbook.html?bookId=<c:out value="${book.bookId}"></c:out>">
                            <button type="button" class="btn btn-danger">归还</button>
                        </a></td>
                    </c:if>
                    <c:if test="${not flag}">
                        <c:if test="${book.number>0}">
                            <td><a href="/reader/lendbook.html?bookId=<c:out value="${book.bookId}"></c:out>">
                                <button type="button" class="btn btn-primary">借阅</button>
                            </a></td>
                        </c:if>
                        <c:if test="${book.number==0}">
                            <td>
                                <button type="button" class="btn btn-defalut" disabled="disabled">已空</button>
                            </td>
                        </c:if>
                    </c:if>
                    <td><a href="/reader/book_detail.html?bookId=<c:out value="${book.bookId}"></c:out>">
                        <button type="button" class="btn btn-success">详情</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
