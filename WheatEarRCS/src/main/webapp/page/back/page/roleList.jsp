<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
</head>

<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角色名称</label>
                            <div class="layui-input-inline">
                                <input type="text" id = "roleName" name="roleName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">角色编码</label>
                            <div class="layui-input-inline">
                                <input type="text"id = "roleCode" name="roleCode" autocomplete="off" class="layui-input">
                            </div>
                        </div>


                        <div class="layui-inline">
                            <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <div class="layui-btn-group">
            <button class="layui-btn data-add-btn" ><i class="layui-icon"></i>添加</button>
            <button class="layui-btn ">添加</button>
            <button class="layui-btn layui-btn-danger data-delete-btn">删除</button>
        </div>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
    </div>
</div>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/RoleManageController//findAllRole.do',
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"},
                {field: 'vid', width: 80, title: 'ID', sort: true},
                {field: 'roleName', width: 80, title: '角色名称', sort: true},
                {field: 'roleCode', width: 80, title: '角色编码', sort: true},
                {field: 'roleType', width: 80, title: '角色类型', sort: true},
                {field: 'roleDesc', title: '角色描述', minWidth: 150},
                {field: 'roleSuper', width: 80, title: '超管'},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            // layer.alert(result, {
            //     title: '最终的搜索信息'
            // });

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {

                    roleName:$('#roleName').val(),
                    roleCode:$('#roleCode').val(),

                }
            }, 'data');

            return false;
        });

        // 监听添加操作
        $(".data-add-btn").on("click", function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/RoleManageController/findUserMenuList.do",
                //data:,
                type:"post",
                dataType:"json",
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    console.log(data);
                    console.log(data.data);
                    //alert();
                    var da = data;
                    if(data.code == 0){
                        //成功后弹出
                        xadmin.open('添加角色','${pageContext.request.contextPath}/page/back/page/role-add.jsp',600,400);


                    }else{
                        layer.msg(data.msg);
                        flag = true;
                    }
                }
            });


            //layer.msg('添加数据');

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {

                }
            });
        });


        // 监听删除操作
        $(".data-delete-btn").on("click", function () {
            var checkStatus = table.checkStatus('currentTableId')
                , data = checkStatus.data;
            layer.alert(JSON.stringify(data));
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                //layer.alert('编辑行：<br>' + JSON.stringify(data));
                //发送请求
                $.ajax({
                    url:"${pageContext.request.contextPath}/RoleManageController/findRoleMenuById.do",
                    data:JSON.stringify(data),
                    type:"post",
                    dataType:"json",
                    contentType: "application/json; charset=utf-8",
                    success:function(data){
                        console.log(data);
                        console.log(data.data);
                        //alert();
                        var da = data;
                        if(data.code == 0){
                            //成功后弹出
                            xadmin.open('编辑角色','${pageContext.request.contextPath}/page/back/page/role-edit.jsp',600,400);



                        }else{
                            layer.msg(data.msg);
                            flag = true;
                        }
                    }
                });

                // edit(data);

            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            }
        });

    });
</script>
<script>

</script>

</body>
</html>