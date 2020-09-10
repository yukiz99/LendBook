<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${book.name}》</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
      <style>
        .container{
            padding-top: 100px; 
        }
        td, th{border: 1px solid transparent !important;}
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

<div class="container col-sm-8 col-sm-offset-2"">
     <div class="col-sm-6 col-sm-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">图书详情</h1>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${book.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${book.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${book.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${book.isbn}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${book.introduction}</td>
                </tr>
                <tr>
                    <th>数量</th>
                    <td>${book.number}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</div>

</body>
</html>
