<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${sessionReader.username}的主页</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
     <style>
         td{border: 1px solid transparent !important;}
          .container{
            padding-top: 100px; 
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
<body  background="/img/index.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;" >


<div id="header"></div>
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
            
           <div class="container col-sm-7 col-sm-offset-3">
          <h2 class="page-header text-success" >密码修改</h2>
           <form class="col-sm-8 col-sm-offset-1" style="margin-top:40px"
              method="post" action="/reader/repasswd_do.html" class="form-inline" id="repasswd">
                <table class="table">
                    <tr>
                       <td class="col-sm-2">旧密码</td>
                       <td><input type="password" id="oldPasswd" name="oldPasswd"></td>
                    </tr>
                     <tr>
                       <td>新密码</td>
                       <td><input type="password" id="newPasswd" name="newPasswd"></td>
                    </tr>
                     <tr>
                       <td>确认密码</td>
                       <td><input type="password" id="reNewPasswd" name="reNewPasswd"></td>
                    </tr>
                    <tr>
                       <td colspan="2">
                         <em id="tishi" style="color: red"></em>
                       </td>
                    </tr>
                     <tr>
                          <td colspan="2">
                          <div class="col-sm-offset-2" style="margin-top:30px">
                           <input type="submit" value="提交" class="btn btn-success">
                          </div>
                       </td>
                    </tr>
                </table>
            </form>
            </div>

<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
        } else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tishi").text("提示:请填写完整!");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
            return false;
        }
    })
</script>


</body>
</html>
