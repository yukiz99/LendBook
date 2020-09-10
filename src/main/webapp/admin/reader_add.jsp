<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加读者</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js" ></script>
    <style>
       td{border: 1px solid transparent !important;}
       .container{
         padding-top: 100px; 
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


   <div class="container col-sm-7 col-sm-offset-3">
               <h2 class="page-header  text-success">读者添加</h2>
            <form style="margin-top:40px"  class="col-sm-8  col-sm-offset-1"
               action="/admin/reader_add_do.html" method="post" id="readeredit" >
               
               <input type="hidden" value="123456" name="password">
               <table class="table">
                 <tr>
                   <td class="col-sm-2">密码</td>
                   <td>123456</td>
                 </tr>
                  <tr>
                   <td>姓名</td>
                   <td><input name="username" id="username"></td>
                 </tr>
                  <tr>
                   <td>性别</td>
                   <td><input name="sex" id="sex"></td>
                 </tr>
                  <tr>
                   <td>地址</td>
                   <td><input name="address" id="address"></td>
                 </tr>
                  <tr>
                   <td>电话</td>
                   <td><input name="phone" id="phone"></td>
                 </tr>
                 <tr>
                     <td colspan="2">
                       <div class="col-sm-offset-2" style="margin-top:30px">
                         <input type="submit" value="添加" class="btn btn-success">
                       </div>
                     </td>
                 </tr>
              </table>
              
            </form>
     </div>

<script>
       function mySubmit(flag){
           return flag;
       }
       $("#readeredit").submit(function () {
           if($("#password").val()==''||$("#username").val()==''||$("#sex").val()==''||||$("#address").val()==''||$("#phone").val()==''){
               alert("请填入完整读者信息！");
               return mySubmit(false);
           }
       })
   </script>

</body>
</html>
