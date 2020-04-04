<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>menu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
    <style>
        .layui-btn:not(.layui-btn-lg ):not(.layui-btn-sm):not(.layui-btn-xs) {
            height: 34px;
            line-height: 34px;
            padding: 0 8px;
        }
        /*.fa {font-size: 25px !important;}*/
        /*.fa:hover {font-size: 50px !important;}*/
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div>
            <div class="layui-btn-group">
                <button class="layui-btn" id="btn-expand">全部展开</button>
                <button class="layui-btn" id="btn-fold">全部折叠</button>
                <button class="layui-btn" id="btn-fold">添加菜单</button>
            </div>
            <table id="munu-table" class="layui-table" lay-filter="munu-table"></table>
        </div>
    </div>
</div>
<!-- 操作列 -->
<script type="text/html" id="auth-state">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var treetable = layui.treetable;

        // 渲染表格
        layer.load(2);
        treetable.render({
            treeColIndex: 1,
            treeSpid: -1,
            treeIdName: 'vid',
            treePidName: 'parentId',
            elem: '#munu-table',
           // url: '../init/menus.json',
            url: '${pageContext.request.contextPath}/MenuManageController/findAllMenu.do',
            page: false,
            cols: [[
                {type: 'numbers'},
                {field: 'menuName', minWidth: 100, title: '菜单名称'},
                {
                    field: 'menuIcon', width: 100,title: '菜单图标',templet: function (d) {
                        //return    '<i class="fa '+d.menuIcon+'"></i><span>'+d.menuIcon+'</span>';

                        return ' <i class="iconfont">'+d.menuIcon+'</i>';

                    }
                 },
                {field: 'menuLink', title: '菜单url'},
                {field: 'menuOrder', width: 80, align: 'center', title: '排序号'},
                {
                    field: 'menuType', width: 80, align: 'center', templet: function (d) {
                        if (d.menuType == 1) {
                            return '<span class="layui-badge layui-bg-gray">后台菜单</span>';
                        }
                        if (d.menuType == -1) {
                            return '<span class="layui-badge layui-bg-blue">目录</span>';
                        } else {
                            return '<span class="layui-badge-rim">菜单</span>';
                        }
                    }, title: '类型'
                },
                {templet: '#auth-state', width: 120, align: 'center', title: '操作'}
            ]],
            done: function () {
                layer.closeAll('loading');
            }
        });

        $('#btn-expand').click(function () {
            treetable.expandAll('#munu-table');
        });

        $('#btn-fold').click(function () {
            treetable.foldAll('#munu-table');
        });

        //监听工具条
        table.on('tool(munu-table)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;

            if (layEvent === 'del') {
                layer.msg('删除' + data.id);
            } else if (layEvent === 'edit') {
                layer.msg('修改' + data.id);
            }
        });
    });
</script>
</body>
</html>