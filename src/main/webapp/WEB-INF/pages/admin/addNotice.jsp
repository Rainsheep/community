<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>发布公告</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/wangEditor/wangEditor-fullscreen-plugin.css">
    </head>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">发布公告</div>
                <div class="layui-card-body">
                    <form class="layui-form">
                        <div class="layui-row layui-form-item">
                            <label>标题：</label><br>
                            <input type="text" lay-verify="required" placeholder="请输入标题" autocomplete="off"
                                   class="layui-input" style="margin-top: 10px" id="title">
                        </div>

                        <div class="layui-row layui-form-item">
                            <label>内容：</label><br>
                            <div id="editor" style="margin-top: 10px"></div>
                        </div>

                        <div class="layui-row layui-form-item">
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

                        <div class="layui-row layui-form-item">
                            <div style="float: right">
                                <button class="layui-btn" id="submit">
                                    立即提交
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/wangEditor-fullscreen-plugin.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgShowBase64 = true;
    editor.create();
    E.fullscreen.init('#editor');
</script>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'upload'], function () {
        var $ = layui.$,
            upload = layui.upload;
        var map = new Map();
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

        $("#reset").click(function () {
            location.reload();
        });

        $("#submit").click(function () {
            // alert(editor.txt.html());

            let obj = Object.create(null);
            for (let [k, v] of map) {
                obj[k] = v;
            }

            $.post("${pageContext.request.contextPath}/notice/addNotice", {
                "title": $("#title").val(),
                "content": editor.txt.html(),
                "files": obj
            }, function (res) {
                layer.msg("发布成功!");
                location.href = "${pageContext.request.contextPath}/allNoticeList?isAdmin=1";
            });
            return false;
        });

    });
</script>
</body>
</html>
