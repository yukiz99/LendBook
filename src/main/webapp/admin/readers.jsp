<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
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
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>


  <div class="container">
       <form   method="get" action="/admin/queryreader.html" class="form-inline" id="searchform">
        <div class="input-group">
           <input type="text" placeholder="学号/姓名" class="form-control" id="search" name="searchWord" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-info">
            </span>
        </div>
    </form>
     
  </div>

<div style="position: relative;top: 15%">
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
     <table class="table table-hover" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>地址</th>
                <th>电话</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="reader">
                <tr>
                    <td><c:out value="${reader.readerId}"></c:out></td>
                    <td><c:out value="${reader.username}"></c:out></td>
                    <td><c:out value="${reader.sex}"></c:out></td>
                    <td><c:out value="${reader.address}"></c:out></td>
                    <td><c:out value="${reader.phone}"></c:out></td>
                    <td><a href="/admin/reader_edit.html?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-info">编辑</button></a></td>
                    <td><a href="/admin/deletereader.html?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-danger">删除</button></a></td>
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
