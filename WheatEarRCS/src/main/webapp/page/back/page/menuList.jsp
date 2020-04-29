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
    <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
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
                <button class="layui-btn" id="btn-add" >添加菜单</button>
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
    layui.use(['table', 'treetable','layer','form'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var treetable = layui.treetable;
        var layer = layui.layer;
        var form  = layui.form;

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
                            return '<span class="layui-badge layui-bg-gray">导航</span>';
                        }
                        if (d.menuType == 2) {
                            return '<span class="layui-badge layui-bg-blue">菜单</span>';
                        } else {
                            return '<span class="layui-badge-rim">按钮</span>';
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
        $('#btn-add').click(function () {
            add();
        });

        //监听工具条
        table.on('tool(munu-table)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;

            if (layEvent === 'del') {
                layer.msg('删除' + data.id);
            } else if (layEvent === 'edit') {
                //layer.msg('修改' + data.id);
                console.log(data);
                 edit(data);
                <%--$.ajax({--%>
                <%--    url:'${pageContext.request.contextPath}/MenuManageController/findMenuParentS.do',--%>
                <%--    type:'post',--%>
                <%--    dataType:'json',--%>
                <%--    contentType: "application/json; charset=utf-8",--%>
                <%--    //async: true,--%>
                <%--    data:JSON.stringify(data),--%>
                <%--    success:function(data){--%>
                <%--        console.log(data);--%>
                <%--        temp = data.data ;--%>
                <%--        if(data.code == 0){--%>
                <%--            // layer.msg(data.msg);--%>
                <%--            xadmin.open('添加角色','${pageContext.request.contextPath}/page/back/page/menu-edit.jsp',600,400);--%>



                <%--        }else{--%>
                <%--            layer.msg(data.msg);--%>
                <%--            flag = true;--%>
                <%--        }--%>

                <%--    }//end of success--%>
                <%--});//end of ajax--%>

            }
        });

        //新增方法
        function add(){
            layer.open({
                type : 2,
                title : '新增菜单',
                area : [ '700px', '500px' ],
                shadeClose : true, // 点击遮罩关闭
                btn : ['保存','取消'],
                content : 'menu-add.jsp',
                success : function(layero, index) { // 成功弹出后回调
                },
                yes : function(index, layero) { // 保存按钮回调函数
                    var form = layer.getChildFrame('form', index);  //获取iframe页的DOM
                    //layer.msg($(form).serialize());
                    console.log($(form));
                    console.log($(form).serialize());
                    console.log(JSON.stringify($(form).serialize()));
                    var map = {
                        "menuName":form.find("#menuName").val(),
                        "menuIcon":form.find("#menuIcon").val(),
                        "menuLink":form.find("#menuLink").val(),
                        "parentId":form.find("#parentId").val(),
                        "menuOrder":form.find("#menuOrder").val(),
                        "menuType":form.find("#menuType").val(),
                        "isEnable":form.find("#isEnable").val()
                    }
                    console.log(JSON.stringify(map));
                    $.ajax({
                        url:'${pageContext.request.contextPath}/MenuManageController/addMenu.do',
                        type:'post',
                        dataType:'json',
                        contentType: "application/json; charset=utf-8",
                        data:JSON.stringify(map),
                        success:function(data){
                            console.log(data);
                            layer.msg('新增成功');


                            // 可以对父窗口进行刷新
                            xadmin.father_reload()

                            layer.close(index); // 关闭弹出层

                        },
                        error:function(data){
                            console.log(data);
                            layer.msg('新增失败');
                        }
                    });//end of ajax
                },
                btn2 : function(index, layero) { // 取消按钮回调函数
                    layer.close(index); // 关闭弹出层
                }
            });
        }//end of add

        //编辑方法
        function edit(data){
            layer.open({
                type : 2,
                title : '编辑菜单',
                area : [ '700px', '500px' ],
                shadeClose : true, // 点击遮罩关闭
                btn : ['保存','取消'],
                content : 'menu-add.jsp',
                success : function(layero, index) { // 成功弹出后回调
                    var form = layer.getChildFrame('form', index);  //获取iframe页的DOM
                    //console.log(data);

                    //给编辑页面元素赋值
                    form.find("#vid").val(data.vid);
                    form.find("#menuName").val(data.menuName);
                    form.find("#menuIcon").val(data.menuIcon);
                    form.find("#menuLink").val(data.menuLink);
                    form.find("#editParentId").val(data.parentId);
                    form.find("#menuOrder").val(data.menuOrder);
                    form.find("#isEnable").val(data.isEnable);
                    form.find("#menuType").val(data.menuType);


                    form.render();
                },
                yes : function(index, layero) { // 保存按钮回调函数
                    //console.log("yes");
                    var form = layer.getChildFrame('form', index);  //获取iframe页的DOM
                    var map = {
                        "vid":form.find("#vid").val(),
                        "menuName":form.find("#menuName").val(),
                        "menuIcon":form.find("#menuIcon").val(),
                        "menuLink":form.find("#menuLink").val(),
                        "parentId":form.find("#parentId").val(),
                        "menuOrder":form.find("#menuOrder").val(),
                        "menuType":form.find("#menuType").val(),
                        "isEnable":form.find("#isEnable").val()
                    }
                    $.ajax({
                        url:'${pageContext.request.contextPath}/MenuManageController/updateMenu.do',
                        type:'post',
                        dataType:'json',
                        contentType: "application/json; charset=utf-8",
                        data:JSON.stringify(map),
                        success:function(data){
                            //console.log(data);
                            layer.msg('修改成功');


                            layer.close(index); // 关闭弹出层

                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        },
                        error:function(data){
                            // console.log(data);
                            layer.msg('修改失败');
                        }
                    });//end of ajax
                },
                btn2 : function(index, layero) { // 取消按钮回调函数
                    layer.close(index); // 关闭弹出层
                }
            });
        }//end of add

    });
</script>
</body>
</html>