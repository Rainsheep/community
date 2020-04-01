<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>活动详情</title>
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
    <style>
        .nav li {
            padding-left: 22px;
            padding-right: 22px;
        }

        .navbar-nav > li:hover {
            height: 48px;
            background: #002C52;
        }

        .blog_content2 img {
            width: 262px;
            height: 180px;
        }

    </style>
    <script>
        $(function () {
            $(".navbar-nav>li").removeClass("current");
            $("#allActivity").addClass("current");
        });
    </script>
</head>
<body>
<%@ include file="header.html" %>
<div class="wrap" style="margin-top: 50px">
    <%-- 左侧导航   --%>
    <div class="wrap_right">
        <h3 class="fenlei">活动详情</h3>
        <div class="n_nav">
            <ul>
                <li class="on"><i>1</i><a href="#activityName">活动名称</a></li>
                <li><i>2</i><a href="#activityTime">活动时间</a></li>
                <li><i>3</i><a href="#activityPlace">活动地点</a></li>
                <li><i>4</i><a href="#activityBelong">活动所属社团</a></li>
                <li><i>5</i><a href="#activityAmount">参与人数</a></li>
                <li><i>6</i><a href="#activityDetail">活动详情</a></li>
                <li><i>8</i><a href="#mname">申请人</a></li>
                <li><i>9</i><a href="#aname">审核人</a></li>
                <li><i>10</i><a href="#updateTime">审核时间</a></li>
                <c:if test="${not empty activity.images}">
                    <li><i>11</i><a href="#activityImg">活动图片</a></li>
                </c:if>

            </ul>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".n_nav li").click(function () {
                    $(this).addClass("on").siblings().removeClass("on");
                });
            });
        </script>
    </div>
    <%--右侧详情--%>
    <div class="wrap_left">
        <%--  头部      --%>
        <div class="ltop" id="activityName">
            <h3>活动名称</h3>
        </div>
        <!-- 详情 -->
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityName"></p>
            </div>
        </div>

        <div class="ltop" id="activityTime">
            <h3>活动时间</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityTime"></p>
            </div>
        </div>

        <div class="ltop" id="activityPlace">
            <h3>活动地点</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityPlace"></p>
            </div>
        </div>

        <div class="ltop" id="activityBelong">
            <h3>活动所属社团</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityBelong"></p>
            </div>
        </div>

        <div class="ltop" id="activityAmount">
            <h3>参与人数</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityAmount"></p>
            </div>
        </div>

        <div class="ltop" id="activityDetail">
            <h3>活动详情</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_activityDetail"></p>
            </div>
        </div>

        <div class="ltop" id="mname">
            <h3>申请人</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_mname"></p>
            </div>
        </div>

        <div class="ltop" id="aname">
            <h3>审核人</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_aname"></p>
            </div>
        </div>
        <div class="ltop" id="updateTime">
            <h3>审核时间</h3>
        </div>
        <div class="news_content">
            <div class="detail-content-body">
                <p id="p_updateTime"></p>
            </div>
        </div>
        <c:if test="${not empty activity.images}">
            <div class="ltop" id="activityImg">
                <h3>活动图片</h3>
            </div>
            <div class="blog">
                <ul class="blog_content2" id="activityImgList">
                    <c:forEach items="${activity.images}" var="activityImg">
                        <li>
                            <div class="blog_img2">
                                <img src="${pageContext.request.contextPath}${activityImg.url}">
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
    <script>
        $("#p_activityName").html("${activity.name}");
        $("#p_activityTime").html("${activity.formatDate}");
        $("#p_activityPlace").html("${activity.place}");
        $("#p_activityBelong").html("${activity.cname}");
        $("#p_activityAmount").html("${activity.amount}");
        $("#p_activityDetail").html("${activity.brDetail}");
        $("#p_mname").html("${activity.managerRealName}");
        $("#p_aname").html("${activity.adminRealName}");
        $("#p_updateTime").html("${activity.formatUpdateTime}");
    </script>
</div>
<%@ include file="footer.html" %>
<!--置顶开始-->
<div class="fix-nav" id="fix-nav" style="display: block;">
    <div class="fix-nav-wrap"><img class="i-totop" src="${pageContext.request.contextPath}/images/to_top.png"/>
    </div>
</div>
<!--置顶结束 -->
</body>
</html>
