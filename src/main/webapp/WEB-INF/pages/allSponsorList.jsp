<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>赞助人员</title>
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

        #sponsorSearch {
            float: right;
            margin-top: 20px;
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
            $("#allSponsor").addClass("current");
        });
        //AJAX局部刷新
        $(function () {
            $("#sponsorSearch").submit(function () {
                load(1);
                return false;
            });
            load(1);
        });

        function load(currentPage) {
            var keyword = $("#keyword").val();
            //ajax 表格和分页
            $.post("${pageContext.request.contextPath}/sponsor/findAll", {
                "currentPage": currentPage,
                "pageSize": 8,
                "keyword": keyword
            }, function (pageInfo) {
                //表格内容
                var sponsor_list = "";
                for (var i = 0; i < pageInfo.list.length; i++) {
                    sponsor_list += "<tr>";
                    sponsor_list += "<td style='vertical-align:middle'>" + (i + 1) + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].realName + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].activityNums + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].formatMoneySum + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].belong + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].phone + "</td>";
                    sponsor_list += "<td style='vertical-align:middle'>" + pageInfo.list[i].address + "</td>";
                    sponsor_list+="<td style='vertical-align:middle'><a class='btn btn-primary' href='"+pageInfo.list[i].detail+"'>查看详情</a></td>"
                    sponsor_list += "</tr>";
                }
                $(".table tr:gt(0)").remove();
                $("table").append(sponsor_list);

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

    </script>
</head>

<body>
<%@ include file="header.html" %>

<div class="container">
    <div class="row">
        <form class="form-inline" id="sponsorSearch">
            <div class="form-group">
                <input type="text" class="form-control" id="keyword" placeholder="keyword">
            </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
    </div>
    <div class="row">
        <table class="table table-bordered" style="color:#0f0f0f;margin-top: 20px;table-layout: fixed">
            <tr class="success">
                <th style="width: 5%">序号</th>
                <th style="width: 7%">赞助人</th>
                <th style="width: 10%">赞助活动数量</th>
                <th style="width: 10%">赞助总金额</th>
                <th style="width: 15%">所属公司</th>
                <th style="width: 13%">联系方式</th>
                <th style="width: 30%">企业地址</th>
                <th style="width: 10%">官网链接</th>
            </tr>

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
