<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑图书信息</title>
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
            $('#header').load('/admin/header.html');
        })
    </script>
</head>
<body background="/img/index.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;
background-attachment: fixed;">

  <div id="header"></div>

    <div class="container col-sm-7 col-sm-offset-3">
   <h2 class="page-header text-success">图书修改</h2>
        <form class="col-sm-8 col-sm-offset-1" style="margin-top:30px" action="/admin/book_edit_do.html?bookId=${book.bookId}" method="post" id="addbook" >

           <table class="table">
	        <tr>
	           <td class="col-sm-2">图书名</td>
	           <td><input name="name" id="name" value="${book.name }"></td>
	        </tr>
             <tr>
	           <td>作者</td>
	           <td><input name="author" id="author" value="${book.author }"></td>
	        </tr>
	         <tr>
	           <td>出版社</td>
	           <td><input name="publish" id="publish" value="${book.publish }"></td>
	        </tr>
	         <tr>
	           <td>ISBN</td>
	           <td><input name="isbn" id="isbn" value="${book.isbn }"></td>
	        </tr>
	         <tr>
	           <td>简介</td>
	           <td> 
	           <textarea rows="4" cols="30"  name="introduction" id="introduction">${book.introduction }</textarea>
	           </td>
	        </tr>
	        <tr>
	           <td>数量</td>
	           <td><input name="number" id="number" value="${book.number }"></td>
	        </tr>
	        <tr>
                   <td colspan="2">
                     <div class="col-sm-offset-2" style="margin-top:30px">
                       <input type="submit" value="修改" class="btn btn-success">
                     </div>
                   </td>
              </tr>
	     </table>
          </form>
         </div> 

 <script>
      $("#addbook").submit(function () {
          if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#number").val()==''){
              alert("请填入完整图书信息！");
              return false;
          }
      })
  </script>

</body>
</html>
