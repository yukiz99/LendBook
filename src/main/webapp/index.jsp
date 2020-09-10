<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
    <style>
        #login{
           height: 50%;
            width: 30%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
        }
   </style>
</head>
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">


<div class="container" >
 <h2 style="text-align: center; color: white; font-family: '华文行楷'; font-size: 500%">图 书 馆</h2>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">请登录</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">账号</label>
            <input type="text" class="form-control" id="id" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="form-group">
            <label>登录身份</label>
            <label class="radio-inline">
               <input type="radio"  id="reader" checked name="type" value="reader">读者
            </label>
            <label class="radio-inline">
               <input type="radio"  id="admin" name="type" value="admin">管理员
            </label>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-primary  btn-block">登录</button>
    </div>
</div>
</div>
    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("提示:账号只能为数字");
                }
                else {
                    $("#info").text("");
                }
            }
        )
  

        $("#loginButton").click(function () {
            var id =$("#id").val();
            var passwd=$("#passwd").val();
            var type;
            if($("#reader").prop('checked')){
            	type="reader";
            }else{
            	type="admin";
            }
            
            if (id == '') {
                $("#info").text("提示:账号不能为空");
            }
            else if( passwd ==''){
                $("#info").text("提示:密码不能为空");
            }
            else if(isNaN( id )){
                $("#info").text("提示:账号必须为数字");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd,
                        type:type
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            $("#info").text("提示:账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            window.location.href="${pageContext.request.contextPath}/admin/main.html";
                        } else if (data.stateCode.trim() === "2") {
                            window.location.href="${pageContext.request.contextPath}/reader/main.html";

                        }
                    }
                });
            }
        })
    </script>

</body>
</html>
