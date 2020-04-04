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
                            <label class="layui-form-label">用户姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" id="userName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">用户账号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userAccount"  id="userAccount" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">用户性别</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sex"  id="sex" autocomplete="off" class="layui-input">
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
            <button class="layui-btn data-add-btn">添加</button>
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
            url: '${pageContext.request.contextPath}/UserManageController/findAll.do',
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"},
                {field: 'vid', width: 80, title: 'ID', sort: true},
                {field: 'userName', width: 80, title: '用户名'},
                {field: 'userSex', width: 80, title: '性别', sort: true},
                //{field: 'city', width: 80, title: '城市'},
                {field: 'userAccount', title: '签名', minWidth: 150},
                {field: 'userAddr', width: 80, title: '地址', sort: true},
                {field: 'userPhone', width: 80, title: '手机号', sort: true},
                {field: 'userState', width: 80, title: '状态',
                    templet:function(data){

                        if(data.userState==0){
                            return '<button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" lay-event="forbidden">禁用</button>';

                        }else{
                            return '<button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-normal" lay-event="use">启用</button>';
                        }
                    }
                    },
                {field: 'remark', width: 135, title: '备注', sort: true},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
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

                    userName:$('#userName').val(),
                    userAccount:$('#userAccount').val(),
                    sex:$('#sex').val(),
                }
            }, 'data');

            return false;
        });

        // 监听添加操作
        $(".data-add-btn").on("click", function () {
            layer.msg('添加数据');
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
                layer.alert('编辑行：<br>' + JSON.stringify(data))
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            }else if(obj.event === 'forbidden'){
                layer.confirm('真的禁用吗？', function(index){
                    //向服务端发送删除指令
                    stateForbidden(data,index);

                })
            }else if(obj.event === 'use'){
                layer.confirm('真的启用吗？', function(index){
                    //向服务端发送删除指令
                    stateForbidden(data,index);

                })



            }
        });

        //禁用方法
        function stateForbidden(data,index){

            var userState = 0;
            if(data.userState==0){
                 userState = 1;
            }
            //向服务端发送删除指令
            $.ajax({
                url:"${pageContext.request.contextPath}/UserManageController/updateState.do",
                type:'post',
                dataType:'json',
                data:JSON.stringify({"vid":data.vid,"userState":userState}),
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    //console.log(data);
                    if(data.code == 1){
                        layer.msg(data.msg);
                    }
                    // obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);//关闭弹出层

                    table.reload('currentTableId', {
                        where: {}
                        ,page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    }); //只重载数据

                },
                error:function(data){
                    // console.log(data);
                    layer.msg('操作失败');
                }
            });//end of ajax

        }

    });
</script>
<script>

</script>

</body>
</html>