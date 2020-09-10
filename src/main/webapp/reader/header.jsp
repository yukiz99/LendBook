<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="/reader/main.html">
                  <p class="text-primary" style="font-family:'华文行楷';font-size:200%">我的图书馆</p>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="/reader/books.html">
                        图书查询
                    </a>
                </li>
                <li>
                    <a href="/reader/info.html" >
                        个人信息
                    </a>
                </li>
                <li >
                    <a href="/reader/lendlist.html" >
                        我的借还
                    </a>
                </li>
                <li >
                    <a href="/reader/repasswd.html" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>${sessionReader.username}, 已登录</a></li>
                <li><a href="/login.html">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
