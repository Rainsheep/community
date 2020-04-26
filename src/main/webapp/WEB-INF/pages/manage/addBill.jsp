<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加账单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">添加账单</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">

                <div class="layui-form-item">
                    <label class="layui-form-label">活动名称</label>
                    <div class="layui-input-block">
                        <select name="activityId" lay-search lay-filter="activityId">
                            <option value="">请选择活动</option>
                            <c:forEach items="${activities}" var="activity">
                                <option value="${activity.id}">${activity.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">花销方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="way" placeholder="请输入花销方式" lay-verift="required"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">花销总金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="cost" placeholder="请输入花销金额" lay-verift="required"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div id="sourceDiv">
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <div class="layui-col-md4">
                            <label class="layui-form-label">花销来源</label>
                            <div class="layui-input-inline">
                                <select name="billDetails[0].supportId" lay-search id="sponsor0"
                                        lay-filter="selectSponsor">
                                    <option value="">请选择赞助商</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-col-md6">
                            <label class="layui-form-label">花销金额</label>
                            <div class="layui-input-inline">
                                <input type="text" name="billDetails[0].money" placeholder="请输入花销金额"
                                       lay-verift="required"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux" id="leftMoney0"></div>
                        </div>

                        <div class="layui-col-md2">
                            <button type="button" class="layui-btn" id="addSource">添加来源</button>
                        </div>
                    </div>

                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">花销时间</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="test-laydate-type-date"
                               name="datetime" autocomplete="off" lay-verify="required"
                               placeholder="yyyy-MM-dd">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">花销地点</label>
                    <div class="layui-input-block">
                        <input type="text" name="place" lay-verify="required" placeholder="请输入花销地点"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea name="note" placeholder="请输入备注" class="layui-textarea"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">证明材料</label>
                    <div class="layui-input-block">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn layui-btn-normal" id="test-upload-testList">
                                选择文件
                            </button>
                            <div class="layui-upload-list">
                                <table class="layui-table">
                                    <thead>
                                    <tr>
                                        <th>文件名</th>
                                        <th>大小</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="test-upload-demoList"></tbody>
                                </table>
                            </div>
                            <button type="button" class="layui-btn" id="test-upload-testListAction">开始上传</button>
                        </div>
                    </div>

                </div>

                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'laydate', 'upload'], function () {
        var $ = layui.$
            , admin = layui.admin
            , element = layui.element
            , layer = layui.layer
            , laydate = layui.laydate
            , form = layui.form
            , upload = layui.upload;

        var activityId;
        var supports;
        var k = 1;
        var map = new Map();

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date'
        });

        //活动被选择
        form.on('select(activityId)', function (data) {
            activityId = data.value;
            $.post("${pageContext.request.contextPath}/support/findSupportByActivityId", {
                page: 1,
                limit: 9999,
                activityId: activityId
            }, function (res) {
                supports = res.data;
                // console.log(support);
                $(".xuanzezanzhushang").remove();
                for (var i = 0; i < supports.length; i++) {
                    var support = supports[i];
                    $("[id^=sponsor]").append('<option value="' + support.id + '" class="xuanzezanzhushang">' + support.realName + '</option>');
                    // console.log(support.id);
                }
                form.render('select');
            })
        });

        //日期时间选择器
        laydate.render({
            elem: '#test-laydate-type-date'
        });

        //赞助商被选择,刷新剩余金额
        form.on('select(selectSponsor)', function (data) {
            var selectedId = data.value; //被选择的赞助表ID
            for (var i = 0; i < supports.length; i++) {
                var support = supports[i];
                if (selectedId == support.id) {
                    $("#leftMoney" + data.elem.id.substring(7)).html("可用金额为" + support.leftMoney);
                }
            }
        });

        //添加来源
        $("#addSource").click(function () {
            var code = "";
            code += '<div class="layui-row layui-col-space10 layui-form-item">';
            code += '<div class="layui-col-md4">';
            code += '<label class="layui-form-label">花销来源</label>';
            code += '<div class="layui-input-inline">';
            code += '<select name="billDetails[' + k + '].supportId" lay-search id="sponsor' + k + '" lay-filter="selectSponsor">';
            code += '<option value="">请选择赞助商</option>';
            for (var i = 0; supports && i < supports.length; i++) {
                var support = supports[i];
                code += '<option value="' + support.id + '" class="xuanzezanzhushang">' + support.realName + '</option>';
            }
            code += '</select>';
            code += '</div>';
            code += '</div>';
            code += '<div class="layui-col-md6">';
            code += '<label class="layui-form-label">花销金额</label>';
            code += '<div class="layui-input-inline">';
            code += '<input type="text" name="billDetails[' + k + '].money" placeholder="请输入花销金额" lay-verift="required" autocomplete="off" class="layui-input">';
            code += '</div>';
            code += '<div class="layui-form-mid layui-word-aux" id="leftMoney' + k + '"></div>';
            code += '</div>';
            code += '</div>';
            $("#sourceDiv").append(code);
            form.render('select');
            k++;
        });

        /* 监听提交 */
        form.on('submit(component-form-demo1)', function (data) {
            var field = data.field;

            let obj = Object.create(null);
            for (let [k, v] of map) {
                obj[k] = v;
            }
            field.files = obj;
            console.log(field);

            $.post("${pageContext.request.contextPath}/bill/addBill", field, function (res) {
                layer.msg(res.msg);
            });
            return false;
        });


        var demoListView = $('#test-upload-demoList')
            , uploadListIns = upload.render({
            elem: '#test-upload-testList'
            , url: '${pageContext.request.contextPath}/file/upload'
            , accept: 'file'
            , multiple: true
            , auto: false
            , bindAction: '#test-upload-testListAction'
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {
                    var tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-mini test-upload-demo-reload layui-hide">重传</button>'
                        , '<button class="layui-btn layui-btn-mini layui-btn-danger test-upload-demo-delete">删除</button>'
                        , '</td>'
                        , '</tr>'].join(''));

                    //单个重传
                    tr.find('.test-upload-demo-reload').on('click', function () {
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.test-upload-demo-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });

                    demoListView.append(tr);
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) { //上传成功
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作

                    for (var key in res["data"]) {
                        map.set(key, res["data"][key]);
                    }


                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.test-upload-demo-reload').removeClass('layui-hide'); //显示重传
            }
        });
    });
</script>
</body>
</html>
