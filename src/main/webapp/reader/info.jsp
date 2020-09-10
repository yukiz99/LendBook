<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${sessionReader.username}的主页</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
     <style>
        .container{
            padding-top: 90px; 
        }
        td, th{border: 1px solid transparent !important;}
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
<div id="header" style="padding-bottom: 80px"></div>
<c:if test="${!empty succ}">
    <div  class="alert alert-success alert-dismissable">
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

<div class="container col-sm-8 col-sm-offset-2"">
     <div class="col-sm-6 col-sm-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">我的信息 </h1>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="20%">学号</th>
                    <td>${reader.readerId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${reader.username}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${reader.sex}</td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>${reader.address}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${reader.phone}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <a class="btn btn-success btn-sm" href="/reader/info_edit.html" role="button">修改</a>
    </div>
</div>
</div>


</body>
</html>
