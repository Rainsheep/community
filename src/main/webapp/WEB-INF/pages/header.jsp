<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="zh_CN">
<head>
    <meta charset="utf-8"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mc.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <style>
        .nav li {
            padding-left: 22px;
            padding-right: 22px;
        }

        .navbar-nav > li:hover {
            height: 48px;
            background: #002C52;
        }
    </style>
</head>

<body>
<!-- 头部开始 -->
<header>
    <div class="wrap">

        <h1 class="logo wow fadeIn"><a href="javascript:void(0);"><img
                src="${pageContext.request.contextPath}/images/logo_03.png"></a></h1>

        <div class="meun">
            <div class="meun-nav"><span></span><span></span><span></span></div>
        </div>
        <div class="clearfix"></div>
    </div>
</header>
<!-- 头部结束 -->

<!--导航开始 -->
<nav class="navbar navbar-default col-sm-12" style="background-color: #0160b0; margin-bottom: -1px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <a class="navbar-brand" href="#" style="color: white; margin-right: 20px; font-size: 25px;font-family: '宋体';">社团活动管理系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="current"><a href="${pageContext.request.contextPath}/index" style="color: white;">首页</a></li>
            <li><a href="#" style="color: white;">通知公告</a></li>
            <li id="allActivity"><a href="${pageContext.request.contextPath}/activity/findAll?currentPage=1&pageSize=10" style="color: white;">社团活动</a></li>
            <li><a href="#" style="color: white;">学生社团</a></li>
            <li><a href="#" style="color: white;">赞助人员</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" style="color: white;">登录</a></li>

        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--导航结束 -->
<!--平板导航开始 -->
<section>
    <div class="meunBox">
        <div class="meunCont">
            <dl>
                <dt><a href="${pageContext.request.contextPath}/index">首页</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">通知公告</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="${pageContext.request.contextPath}/activity/findAll?currentPage=1&pageSize=10">社团活动</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">学生社团</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">赞助人员</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">登录</a></dt>
                <dd>

                </dd>
            </dl>
        </div>
    </div>
</section>
<!--平板导航结束 -->
</body>
</html>