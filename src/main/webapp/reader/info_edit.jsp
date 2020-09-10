<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${sessionReader.username}的主页</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
    <style>
       .container{
            padding-top: 100px; 
        }
        td{border: 1px solid transparent !important;}
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

 <div class="container col-sm-7 col-sm-offset-3">
         <h2 class="page-header text-success">信息修改</h2>
       
         <form class="col-sm-8 col-sm-offset-1" style="margin-top:30px" 
                action="/reader/info_edit_do.html" method="post" id="edit" >
            <input type="hidden" name="readerId" value="${reader.readerId}">
            <input type="hidden" name="username" value="${reader.username}">
            <table class="table">
                 <tr>
                   <td class="col-sm-2">学号</td>
                   <td>${reader.readerId}</td>
                 </tr>
                <tr>
                   <td>姓名</td>
                   <td>${reader.username}</td>
                 </tr>
                  <tr>
                    <td>性别</td>
                    <td><input  name="sex" id="sex"  value="${reader.sex}"></td>
                 </tr>
                  <tr>
                   <td>地址</td>
                   <td><input name="address" id="address"  value="${reader.address}"></td>
                 </tr>
                  <tr>
                   <td>电话</td>
                   <td><input name="phone" id="phone"  value="${reader.phone}"></td>
                 </tr>
                  <tr>
                    <td colspan="2">
                      <div class="col-sm-offset-2" style="margin-top:30px">
                        <input type="submit" value="确定" class="btn btn-success">
                      </div>
                    </td>
               </tr>
            </table>
               
            </form>
          </div>  
 <script>
       $("#edit").submit(function () {
           if($("#sex").val()==''||$("#address").val()==''||$("#phone").val()==''){
               alert("请填入完整信息！");
               return false;
           }
       })
   </script>
</body>
</html>
