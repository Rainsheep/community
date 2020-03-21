<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh_CN">
<head>
    <meta charset="utf-8"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>学生社团活动管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/mc.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
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

        <h1 class="logo wow fadeIn"><a href="javascript:void(0);"><img src="images/logo_03.png"></a></h1>

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
        <a class="navbar-brand" href="#"
           style="color: white; margin-right: 20px; font-size: 25px;font-family: '宋体';">社团活动管理系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="current"><a href="#" style="color: white;">首页</a></li>
            <li><a href="#" style="color: white;">通知公告</a></li>
            <li><a href="#" style="color: white;">社团活动</a></li>
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
                <dt><a href="index.html">首页</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">通知公告</a></dt>
                <dd>

                </dd>
            </dl>
            <dl>
                <dt><a href="#">社团活动</a></dt>
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

<!--banner开始 -->
<section class="topbanner">
    <div class="banner">
        <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel" data-interval="5000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                <li data-target="#carousel" data-slide-to="1"></li>
                <li data-target="#carousel" data-slide-to="2"></li>


            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">

                <div class="item active">
                    <a href="javascript:void(0);"><img src="images/banner4.jpg" width="100%"></a>
                </div>

                <div class="item">
                    <a href="javascript:void(0);"> <img src="images/banner2.jpg" width="100%"></a>
                </div>

                <div class="item">
                    <a href="javascript:void(0);"> <img src="images/banner3.jpg" width="100%"></a>
                </div>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--banner-->
</section>
<!--banner结束 -->

<!-- 公告开始 -->
<section id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-xs-12 col-sm-6">
                <ul class="nav nav-tabs" role="tablist" id="myTab1">
                    <li role="presentation" class="active"><a href="#idxnews" aria-controls="idxNews" role="tab"
                                                              data-toggle="tab" aria-expanded="true">最新活动</a></li>

                    <p class="text-right" style="padding-top: 15px;"><a href="javascript:void(0);">更多>></a></p>
                </ul>
                <div class="tab-content" id="myTabContent1">
                    <div role="tabpanel" class="tab-pane active" id="idxnews">

                    </div>

                </div>
            </div>

            <div class="col-md-5 col-xs-12 col-sm-6">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#idxnews2" aria-controls="idxNews2" role="tab"
                                                              data-toggle="tab" aria-expanded="true">通知公告</a></li>
                    <p class="text-right" style="padding-top: 15px;"><a href="javascript:void(0);">更多>></a>
                    </p>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="idxnews2">
                        <ul id="tzgg">

                        </ul>
                    </div>
                </div>
            </div>

            <script>
                $(function () {
                    // tab_floatingSwitch('#myTab1 >  li', '#myTabContent1 > div');
                });

                /* tab页自动切换 */
                function tab_floatingSwitch(id_1, id_2) {
                    // tab页自动切换
                    $(id_1).hover(function () { // 悬停
                        $(id_1).removeClass("active"); // 移除所有 li 样式
                        $(this).addClass("active"); // 给自己添加 li 样式

                        $(id_2).removeClass("in active"); // 移除所有tab样式

                        var href = $(this).children().attr("href");
                        $(href).addClass(" in active"); // 给自己添加 tab样式
                    });
                }
            </script>

        </div>
    </div>
</section>


<!--link开始 -->
<section class="about">

    <div class="container">
        <div class="row">
            <div class="MultiCarousel" data-items="1,2,4,4" data-slide="1" id="MultiCarousel" data-interval="1000">
                <div class="MultiCarousel-inner">
                    <div class="item" style="width: 285px;">
                        <div class="pad15">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong1.png"></a>
                        </div>
                    </div>
                    <div class="item" style="width: 285px;">
                        <div class="pad15">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong3.png"></a>
                        </div>
                    </div>
                    <div class="item" style="width: 285px;">
                        <div class="pad15">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong4.png"></a>
                        </div>
                    </div>
                    <div class="item" style="width: 285px;">
                        <div class="pad15" style="width: 285px;">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong5.png"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="pad15" style="width: 285px;">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong6.png"></a>
                        </div>
                    </div>
                    <div class="item" style="width: 285px;">
                        <div class="pad15">
                            <a target="_blank" href="javascript:void(0);"> <img src="images/huodong2.png"></a>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary leftLst">
                    <
                </button>
                <button class="btn btn-primary rightLst">>
                </button>
            </div>
        </div>

    </div>
</section>
<!--link结束 -->

<!--link2开始 -->
<div class="content">
    <div class="row" style="text-align: center;">
        <img src="images/footer.png" style="height: 180px;">
    </div>
</div>
<!--link2结束 -->

<!--底部开始 -->
<footer>
    <div class="wrap footer">
        <div class="footerleftimg"><img src="images/ncwu.png"></div>
        <div class="foot clearfix">
            <ul class="foot_nav fl">
                <dl class="wow slideInUp" data-wow-delay="0.9s">
                    <dd>花园校区地址：河南省郑州市北环路36号&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;邮编：450045</dd>
                    <dd>龙子湖校区地址：河南省郑州市金水东路136号 &nbsp;&nbsp;&nbsp;&nbsp;邮编：450046</dd>
                    <dd>
                    </dd>
                </dl>
            </ul>
        </div>

    </div>
</footer>
<!--底部结束 -->
<!--置顶开始-->
<div class="fix-nav" id="fix-nav" style="display: block;">
    <div class="fix-nav-wrap"><img class="i-totop" src="images/to_top.png"/>
    </div>
</div>
<!--置顶结束 -->

<script>
    $(function () {
        $.ajax({
            type: "GET",
            //async: "false",
            dataType: "json",
            // dataType : "jsonp", // 返回的数据类型，设置为JSONP方式                jsonp : 'callback', //指定一个查询参数名称来覆盖默认的 jsonp 回调参数名 callback
            // jsonp: "jsoncallback",         //自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名
            url: "https://news.ncwu.edu.cn/channels/newsindex.json",
            success: function (result) {
                var str = "<ul>";
                $.each(result["news"], function (index, obj) {
                    str += "<li><a href='" + obj["NavigationUrl"] + "' target='_blank' style='color:" + obj[
                            "TitleColor"] + "' title='" + obj["Title"] + "'><em></em>" + obj["Title"] + "</a><span>" +
                        obj["AddDate"] + "</span></li>";
                });
                $("#idxnews").append(str + "</ul>");
            }
        });
    });
</script>

<script>
    $(function () {
        $.ajax({
            type: "GET",
            //async: "false",
            dataType: "json",
            // dataType : "jsonp", // 返回的数据类型，设置为JSONP方式                jsonp : 'callback', //指定一个查询参数名称来覆盖默认的 jsonp 回调参数名 callback
            // jsonp: "jsoncallback",         //自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名
            url: "https://news.ncwu.edu.cn/dataindex/dataindex.json",
            success: function (result) {
                var str = "";
                $.each(result["tzgg"], function (index, obj) {
                    str += "<li><a href='" + obj["NavigationUrl"] + "' target='_blank' style='color:" + obj[
                            "TitleColor"] + "' title='" + obj["Title"] + "'><em></em>" + obj["Title"] + "</a><span>" +
                        obj["AddDate"] + "</span></li>";
                    //str += "<li><u><a href='"+obj["bmtzurl"]+"'>【"+obj["bmmc"]+"】</a><a href='"+obj["NavigationUrl"]+"' target='_blank' title='"+obj["Title"]+"'>"+obj["Title"]+"</a></u><i>"+obj["AddDate"]+"</i></li>";
                });
                $("#tzgg").append(str);

            }
        });
    });
</script>
</body>

</html>
