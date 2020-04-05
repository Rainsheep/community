<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通知公告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pages.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mc.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>

    <style>
        .nav li {
            padding-left: 22px;
            padding-right: 22px;
        }

        .navbar-nav > li:hover {
            height: 48px;
            background: #002C52;
        }

        tr:hover {
            background-color: #dff0d8;
        }

        #page {
            background-color: #e9f0fd;
            margin-bottom: 50px;
            float: right;
        }

        .page {
            line-height: 30px;
            text-align: center;
            margin-top: 10px;
            display: block;
            margin-right: auto;
            margin-bottom: 0;
            margin-left: auto;
        }

        .page ul {
            display: inline-block;
            margin: 0 auto
        }

        .page li {
            line-height: 30px;
            display: inline-block;
            border: 1px solid #ddd;
            float: left;
            cursor: pointer;
            margin-top: 3px;
            margin-bottom: 3px;
            padding-top: 0;
            padding-right: 10px;
            padding-bottom: 0;
            padding-left: 10px;
            margin-right: -1px;
        }

        .page li a {
            line-height: 30px;
            height: 30px;
            display: block;
        }

        .page li.thisclass {
            color: #fff;
            background-color: #004684;
            line-height: 32px;
            height: 32px;
            padding-top: 0px;
            padding-bottom: 0;
            border: 1px solid #004684;
        }

        .page ul li.thisclass a:hover, .page ul li.thisclass a {
            color: #fff;
            background-color: #004684;
            line-height: 30px;
            height: 30px;
            padding-top: 0px;
            padding-bottom: 0;
        }

        .page li:hover {
            color: #fff;
            background-color: #004684;
            border: 1px solid #004684;
        }

        .page li:hover a {
            color: #fff;
        }

        #activity_search {
            float: right;
            margin-top: 20px;
            margin-right: 60px;
        }

        #collapseExample {
            margin-top: 110px;
        }

        .well {
            margin-bottom: 0;
            background-color: #e9f0fd;
        }

        .oneline {
            white-space: nowrap;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            overflow: hidden;
        }
    </style>
    <script>
        //导航
        $(function () {
            $(".navbar-nav>li").removeClass("current");
            $("#allNotice").addClass("current");
        });
        //AJAX局部刷新
        $(function () {
            $("#noticeSearch").submit(function () {
                // alert(1);
                load(1);
                return false;
            });
            load(1);
        });

        function load(currentPage) {
            var keyword = $("#keyword").val();
            // alert(keyword);
            //ajax 表格和分页
            $.post("${pageContext.request.contextPath}/notice/findAll", {
                "currentPage": currentPage,
                "pageSize": 8,
                "keyword": keyword
            }, function (pageInfo) {
                // console.log(pageInfo);
                //表格内容
                var notice_list = "";
                for (var i = 0; i < pageInfo.list.length; i++) {
                    notice_list += '<div class="news-item">';
                    notice_list += '<div class="date">';
                    notice_list += '<div class="day">' + pageInfo.list[i].formatDay + '</div>';
                    notice_list += '<div class="month">' + pageInfo.list[i].formatMonth + '</div>';
                    notice_list += '</div>';
                    notice_list += '<div class="description">';
                    notice_list += '<h2>【通知】';
                    <c:if test="${empty isAdmin}">
                    notice_list += '<a href="${pageContext.request.contextPath}/notice/noticeDetail?noticeId=' + pageInfo.list[i].id + '">' + pageInfo.list[i].title + '</a>';
                    </c:if>

                    <c:if test="${not empty isAdmin}">
                    notice_list += '<a href="${pageContext.request.contextPath}/notice/noticeDetail?onlyContent=1&noticeId=' + pageInfo.list[i].id + '">' + pageInfo.list[i].title + '</a>';
                    </c:if>
                    notice_list += '</h2>';
                    notice_list += '<div class="cont"><div class="words"><div class="detail">';
                    notice_list += pageInfo.list[i].simpleContent;
                    notice_list += '</div></div>';
                    <c:if test="${not empty isAdmin}">
                    notice_list += '<a type="button" class="btn btn-default btn-xs" style="background-color: #30a89d;color: white" href="${pageContext.request.contextPath}/notice/changeNotice?noticeId=' + pageInfo.list[i].id + '">修改</a>';
                    notice_list += '<button type="button" class="btn btn-default btn-xs" style="background-color: #ff5722;color: white;margin-left: 10px" onclick="deleteNotice(' + pageInfo.list[i].id + ');">删除</button>';
                    </c:if>
                    notice_list += '</div></div></div>';
                }
                $(".news-list div:gt(0)").remove();
                $(".news-list").append(notice_list);


                //分页导航条
                var pages_list = "";
                //首页
                if (pageInfo.isFirstPage) {
                    pages_list += "<li>首页</li>";
                } else {
                    pages_list += "<li onclick='load(1)'>首页</li>";
                }

                //上一页
                if (pageInfo.hasPreviousPage) {
                    pages_list += "<li onclick='load(" + pageInfo.prePage + ")'>上一页</li>";
                } else {
                    pages_list += "<li>上一页</li>";
                }
                //页码序列
                if (pageInfo.pages == 0) {
                    pages_list += "<li class='thisclass'>1</li>";
                }

                var begin;
                var end;
                if (pageInfo.pages <= 5) {
                    begin = 1;
                    end = pageInfo.pages;
                } else {
                    begin = pageInfo.pageNum - 2;
                    end = pageInfo.pageNum + 2;

                    if (begin < 1) {
                        begin = 1;
                        end = 5;
                    }
                    if (end > pageInfo.pages) {
                        end = pageInfo.pages;
                        begin = end - 4;
                    }
                }

                for (var i = begin; i <= end; i++) {
                    if (i == pageInfo.pageNum) {
                        pages_list += "<li class='thisclass'>" + i + "</li>";
                    } else {
                        pages_list += "<li onclick='load(" + i + ")'>" + i + "</li>";
                    }
                }
                //下一页
                if (pageInfo.hasNextPage) {
                    pages_list += "<li onclick='load(" + pageInfo.nextPage + ")'>下一页</li>";
                } else {
                    pages_list += "<li>下一页</li>";
                }

                //尾页
                if (pageInfo.isLastPage) {
                    pages_list += "<li>尾页</li>";
                } else {
                    pages_list += "<li onclick='load(" + pageInfo.pages + ")'>尾页</li>";
                }

                $(".page>ul").html(pages_list);

                //自动滚回顶部
                scrollTo(0, 0);
            }, "json");
        }

        function deleteNotice(id) {
            layer.confirm('确定要删除吗?', {icon: 3, title: '提示'}, function (index) {
                $.post("${pageContext.request.contextPath}/notice/deleteNotice", {
                    "noticeId": id
                }, function (data) {
                    layer.close(index);
                    layer.msg(data.msg);
                    load(1);
                });
            });
        }

    </script>
</head>

<body>
<c:if test="${empty isAdmin}">
    <%@ include file="header.html" %>
</c:if>


<!--内容开始 -->
<div class="wrap" style="margin-top: 50px">
    <%-- 头部 --%>
    <div class="wrap_left1">
        <div class="ltop">
            <h3>通知公告</h3>
            <div class="fr">
                <form class="form-inline" id="noticeSearch">
                    <div class="form-group">
                        <input type="text" class="form-control" id="keyword" placeholder="keyword">
                    </div>
                    <button type="submit" class="btn btn-primary">搜索</button>
                </form>
            </div>
        </div>
        <%-- 通知公告 --%>
        <div class="news_content">
            <!-- 新闻列表 -->
            <div class="news-list">
                <!-- 重复内容 -->
                <%--                <div class="news-item">--%>
                <%--                    <div class="date">--%>
                <%--                        <div class="day">28</div>--%>
                <%--                        <div class="month">2020-03</div>--%>
                <%--                    </div>--%>
                <%--                    <div class="description">--%>
                <%--                        <h2>【通知】--%>
                <%--                            <a href="#">关于2020年清明节放假及学校值班安排的通知</a>--%>
                <%--                        </h2>--%>
                <%--                        <div class="cont">--%>
                <%--                            <div class="words">--%>
                <%--                                <div class="detail">--%>
                <%--                                    校属各单位：根据《河南省教育厅办公室关于2020年清明节放假安排的通知》（教办函〔2020〕86号）精神，为便于全校师生及早合理安排工作、学习，现将我校2020年清明节放假及学校值班安排通知如下：一、放假安排及相关要求（一）放假时间4月4日至6日放假调休，共3天。（二）相关...--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                            <button type="button" class="btn btn-default btn-xs"--%>
                <%--                                    style="background-color: #30a89d;color: white" onclick="updateNotice(1)">修改--%>
                <%--                            </button>--%>
                <%--                            <button type="button" class="btn btn-default btn-xs"--%>
                <%--                                    style="background-color: #ff5722;color: white;margin-left: 10px"--%>
                <%--                                    onclick="deleteNotice(1);">删除--%>
                <%--                            </button>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                </div>--%>
            </div>
            <!-- 新闻列表 END -->
        </div>
    </div>
</div>


<div class="container">
    <!-- 分页 -->
    <div class="page" style="margin-bottom: 30px">
        <ul>

        </ul>
    </div>
    <!-- 分页 END -->
</div>
<c:if test="${empty isAdmin}">
    <%@ include file="footer.html" %>
</c:if>

<!--置顶开始-->
<div class="fix-nav" id="fix-nav" style="display: block;">
    <div class="fix-nav-wrap"><img class="i-totop" src="${pageContext.request.contextPath}/images/to_top.png"/>
    </div>
</div>
<!--置顶结束 -->
</body>

</html>
