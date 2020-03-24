<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>社团活动</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pages.css"/>--%>
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
    </style>
    <script>
        //导航
        $(function () {
            $(".navbar-nav>li").removeClass("current");
            $("#allActivity").addClass("current");
        });
        //AJAX局部刷新
        $(function () {
            $("#conditionSearch").submit(function () {
                load(1);
                return false;
            });
            load(1);
        });

        function load(currentPage) {
            var activityName = $("#activityName").val();
            var activityTime = $("#activityTime").val();
            var activityPlace = $("#activityPlace").val();
            var community = $("#community").val();
            //ajax 表格和分页
            $.post("${pageContext.request.contextPath}/activity/findAll", {
                "currentPage": currentPage,
                "pageSize": 8,
                "activityName": activityName,
                "activityTime": activityTime,
                "activityPlace": activityPlace,
                "community": community
            }, function (pageInfo) {
                //表格内容
                var activity_list = "";
                for (var i = 0; i < pageInfo.list.length; i++) {
                    activity_list += "<tr>";
                    activity_list += "<td>" + (i + 1) + "</td>";
                    activity_list += "<td>" + pageInfo.list[i].name + "</td>";
                    activity_list += "<td>" + pageInfo.list[i].formatDate + "</td>";
                    activity_list += "<td>" + pageInfo.list[i].place + "</td>";
                    activity_list += "<td>" + pageInfo.list[i].cname + "</td>";
                    activity_list += "<td>" + pageInfo.list[i].amount + "</td>";
                    activity_list += "<td><a class='btn btn-primary' href='${pageContext.request.contextPath}/activity/activityDetail?activityId=" + pageInfo.list[i].id + "'>查看详情</a></td>";
                    activity_list += "</tr>";
                }
                $(".table tr:gt(0)").remove();
                $("table").append(activity_list);

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

        //分页
        <%--$(function () {--%>
        <%--    var list = "";--%>
        <%--    //首页--%>
        <%--    if (${activityPageInfo.isFirstPage}) {--%>
        <%--        list += "<li>首页</li>";--%>
        <%--    } else {--%>
        <%--        list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=1&pageSize=10'>首页</a></li>";--%>
        <%--    }--%>

        <%--    //上一页--%>
        <%--    if (${activityPageInfo.hasPreviousPage}) {--%>
        <%--        list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.prePage}&pageSize=10'>上一页</a></li>";--%>
        <%--    } else {--%>
        <%--        list += "<li>上一页</li>";--%>
        <%--    }--%>
        <%--    //页码序列--%>
        <%--    if (${activityPageInfo.pages==0})--%>
        <%--    {--%>
        <%--        list += "<li class='thisclass'>1</li>";--%>
        <%--    }--%>
        <%--    for (var i = 1; i <= ${activityPageInfo.pages}; i++) {--%>
        <%--        if (i ==${activityPageInfo.pageNum}) {--%>
        <%--            list += "<li class='thisclass'><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=" + i + "&pageSize=10'>" + i + "</a></li>";--%>
        <%--        } else {--%>
        <%--            list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=" + i + "&pageSize=10'>" + i + "</a></li>";--%>
        <%--        }--%>
        <%--    }--%>
        <%--    //下一页--%>
        <%--    if (${activityPageInfo.hasNextPage}) {--%>
        <%--        list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.nextPage}&pageSize=10'>下一页</a></li>";--%>
        <%--    } else {--%>
        <%--        list += "<li>下一页</li>";--%>
        <%--    }--%>

        <%--    //尾页--%>
        <%--    if (${activityPageInfo.isLastPage}) {--%>
        <%--        list += "<li>尾页</li>";--%>
        <%--    } else {--%>
        <%--        list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.navigateLastPage}&pageSize=10'>尾页</a></li>";--%>
        <%--    }--%>

        <%--    $(".page>ul").html(list);--%>


        <%--});--%>
    </script>
</head>

<body>
<%--<jsp:include page="header.jsp" flush="true"/>--%>
<%@ include file="header.html" %>

<div class="container">
    <div class="row">
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample" id="activity_search">
            条件查询
        </button>
        <div class="collapse" id="collapseExample">
            <div class="well">
                <form class="form-inline"  id="conditionSearch">
                    <div class="form-group">
                        <label for="activityName">活动名称</label>
                        <input type="text" class="form-control" id="activityName" name="activityName"
                               placeholder="Activity Name">
                    </div>
                    <div class="form-group">
                        <label for="activityTime">活动时间</label>
                        <input type="text" class="form-control" id="activityTime" name="activityTime"
                               placeholder="yyyy-MM-dd">
                    </div>
                    <div class="form-group">
                        <label for="activityPlace">活动地点</label>
                        <input type="text" class="form-control" id="activityPlace" name="activityPlace"
                               placeholder="Activity Place">
                    </div>
                    <div class="form-group">
                        <label for="community">所属社团</label>
                        <input type="text" class="form-control" id="community" name="community" placeholder="Community">
                    </div>

                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <table class="table table-bordered" style="color:#0f0f0f;margin-top: 20px">
            <tr class="success">
                <th>序号</th>
                <th>活动名称</th>
                <th>活动时间</th>
                <th>活动地点</th>
                <th>所属社团</th>
                <th>参与人数</th>
                <th>操作</th>
            </tr>
            <%--            <c:forEach items="${activityPageInfo.list}" var="activity" varStatus="s">--%>
            <%--                <tr>--%>
            <%--                    <td>${s.count}</td>--%>
            <%--                    <td>${activity.name}</td>--%>
            <%--                    <td>${activity.formatDate}</td>--%>
            <%--                    <td>${activity.place}</td>--%>
            <%--                    <td>${activity.cname}</td>--%>
            <%--                    <td>${activity.amount}</td>--%>
            <%--                    <td>--%>
            <%--                        <a class="btn btn-primary"--%>
            <%--                           href="${pageContext.request.contextPath}/activity/activityDetail?activityId=${activity.id}"--%>
            <%--                           role="button">查看详情</a>--%>
            <%--                    </td>--%>
            <%--                </tr>--%>
            <%--            </c:forEach>--%>

        </table>
    </div>

    <!-- 分页 -->
    <div class="page" style="margin-bottom: 30px">
        <ul>

        </ul>
    </div>
    <!-- 分页 END -->
</div>


<%--<jsp:include page="footer.jsp"/>--%>
<%@ include file="footer.html" %>
<!--置顶开始-->
<div class="fix-nav" id="fix-nav" style="display: block;">
    <div class="fix-nav-wrap"><img class="i-totop" src="${pageContext.request.contextPath}/images/to_top.png"/>
    </div>
</div>
<!--置顶结束 -->
</body>

</html>
