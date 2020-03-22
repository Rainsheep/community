<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>社团活动</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".navbar-nav>li").removeClass("current");
            $("#allActivity").addClass("current");
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>


</body>
</html>
