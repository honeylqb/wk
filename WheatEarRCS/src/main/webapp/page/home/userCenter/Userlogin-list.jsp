<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
</head>
<body>
<div class="layuimini-container">

    <div class="layuimini-main">

    </div>

        <fieldset class="layui-elem-field layuimini-search">
            <legend>登录记录</legend>
<%--            <div style="margin: 10px 10px 10px 10px">--%>
<%--                <form class="layui-form layui-form-pane" action="">--%>
<%--                    <div class="layui-form-item">--%>
<%--                        <div class="layui-inline">--%>
<%--                            <label class="layui-form-label">图片名称</label>--%>
<%--                            <div class="layui-input-inline">--%>
<%--                                <input type="text" name="imageName" autocomplete="off" class="layui-input">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="layui-inline">--%>
<%--                            <label class="layui-form-label">小麦品种</label>--%>
<%--                            <div class="layui-input-inline">--%>
<%--                                <input type="text" name="wheatType" autocomplete="off" class="layui-input">--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                        <div class="layui-inline">--%>
<%--                            <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>


        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        </fieldset>
            <script type="text/html" id="currentTableBar">
<%--            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>--%>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
    </div>
<%--<jsp:include page="${pageContext.request.contextPath}/page/main/footer.jsp"></jsp:include>--%>
</div>

<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/UserManageController/findUserLoginLog.do',
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"},
                {field: 'loginTime', width: 150, title: '登录时间', sort: true},

               // {field: 'userId', width: 80, title: 'ID', sort: true},
                {field: 'explorer', width: 150, title: '浏览器核心', sort: true},
                {field: 'OS', width: 150, title: '操作系统', sort: true},
                {field: 'ipPort', width: 200, title: 'ip：port'},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            method:'post',
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            });

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    searchParams: result
                }
            }, 'data');

            return false;
        });




        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layer.alert('编辑行：<br>' + JSON.stringify(data))
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    layer.alert('删除行：<br>' + JSON.stringify(data))
                });
            }
        });

    });
</script>
<script>

</script>

</body>
</html>