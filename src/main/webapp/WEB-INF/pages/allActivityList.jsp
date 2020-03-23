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
    </style>
    <script>
        //导航
        $(function () {
            $(".navbar-nav>li").removeClass("current");
            $("#allActivity").addClass("current");
        });
        <%--//AJAX局部刷新--%>
        <%--$(function () {--%>
        <%--   load(1);--%>
        <%--});--%>
        <%--function load(currentPage){--%>
        <%--    $.get("${pageContext.request.contextPath}/activity/findAll",{"currentPage":currentPage,"pageSize":10},function (pageInfo) {--%>
        <%--        --%>
        <%--    },"json");--%>
        <%--}--%>
        //分页
        $(function () {
            var list = "";
            //首页
            if (${activityPageInfo.isFirstPage}) {
                list += "<li>首页</li>";
            } else {
                list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=1&pageSize=10'>首页</a></li>";
            }

            //上一页
            if (${activityPageInfo.hasPreviousPage}) {
                list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.prePage}&pageSize=10'>上一页</a></li>";
            } else {
                list += "<li>上一页</li>";
            }
            //页码序列
            if (${activityPageInfo.pages==0})
            {
                list += "<li class='thisclass'>1</li>";
            }
            for (var i = 1; i <= ${activityPageInfo.pages}; i++) {
                if (i ==${activityPageInfo.pageNum}) {
                    list += "<li class='thisclass'><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=" + i + "&pageSize=10'>" + i + "</a></li>";
                } else {
                    list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=" + i + "&pageSize=10'>" + i + "</a></li>";
                }
            }
            //下一页
            if (${activityPageInfo.hasNextPage}) {
                list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.nextPage}&pageSize=10'>下一页</a></li>";
            } else {
                list += "<li>下一页</li>";
            }

            //尾页
            if (${activityPageInfo.isLastPage}) {
                list += "<li>尾页</li>";
            } else {
                list += "<li><a href='${pageContext.request.contextPath}/activity/findAll?currentPage=${activityPageInfo.navigateLastPage}&pageSize=10'>尾页</a></li>";
            }

            $(".page>ul").html(list);


        });
    </script>
</head>

<body>
<%--<jsp:include page="header.jsp" flush="true"/>--%>
<%@ include file="header.html" %>
<div class="container">
    <div class="row">
        <table class="table table-bordered" style="color:#0f0f0f;margin-top: 80px">
            <tr class="success">
                <th>活动序号</th>
                <th>活动名称</th>
                <th>活动时间</th>
                <th>活动地点</th>
                <th>所属社团</th>
                <th>参与人数</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${activityPageInfo.list}" var="activity" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${activity.name}</td>
                    <td>${activity.formatDate}</td>
                    <td>${activity.place}</td>
                    <td>${activity.cname}</td>
                    <td>${activity.amount}</td>
                    <td>
                        <a class="btn btn-primary"
                           href="${pageContext.request.contextPath}/activity/activityDetail?activityId=${activity.id}"
                           role="button">查看详情</a>
                    </td>
                </tr>
            </c:forEach>

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
