<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
    
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
            $('#header').load('/admin/header.html');
        })
    </script>
</head>
<body  background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div class="container">
    <form   method="get" action="/admin/querybook.html" class="form-inline"  id="searchform">
        <div class="input-group">
           <input type="text" placeholder="图书名/作者" class="form-control" id="search" name="searchWord" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-info">
            </span>
        </div>
    </form>
</div>

<div style="position: relative;top: 20%">
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
                <th>编辑</th>
                <th>删除</th>
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
                <td><a href="/admin/book_edit.html?bookId=<c:out value="${book.bookId}"></c:out>"><button type="button" class="btn btn-info">编辑</button></a></td>
                <td><a href="/admin/deletebook.html?bookId=<c:out value="${book.bookId}"></c:out>"><button type="button" class="btn btn-danger">删除</button></a></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
     </div>
     
   <script>
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''||val==null){
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</body>
</html>
