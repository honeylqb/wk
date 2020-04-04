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

<%--        <div class="layui-fluid">--%>
<%--            <div class="layui-row layui-col-space15">--%>
<%--                <div class="layui-col-md12">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-body ">--%>
<%--                            <a onclick="parent.xadmin.add_tab('在tab打开','https://www.baidu.com',true)" style="color: red" href="javascript:;">iframe页面中打开tab事例</a>--%>
<%--                            <br>--%>
<%--                            <a onclick="parent.xadmin.add_tab('在tab打开','https://www.baidu.com')" style="color: red" href="javascript:;">iframe页面中打开tab事例(重复点击不刷新)</a>--%>
<%--                            <br>--%>
<%--                            <a onclick="xadmin.open('iframe页面中打开open事例','https://www.163.com')" style="color: red" href="javascript:;">iframe页面中打开open事例</a>--%>
<%--                            <br>--%>
<%--                            <a onclick="parent.xadmin.open('在上一级窗口打开open事件','http://www.baidu.com')" style="color: red" href="javascript:;">在上一级窗口打开open事件</a>--%>
<%--                            <br>--%>
<%--                            <a onclick="xadmin.del_tab()" style="color: red" href="javascript:;">在子页面关闭自己本身tab</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>

        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">图片名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="imageName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">小麦品种</label>
                            <div class="layui-input-inline">
                                <input type="text" name="wheatType" autocomplete="off" class="layui-input">
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
            <button class="layui-btn " onclick="parent.xadmin.open('在tab打开','${pageContext.request.contextPath}/page/imageManage/AddImage.jsp')">添加2</button>
            <button class="layui-btn data-add-btn">添加</button>
            <button class="layui-btn layui-btn-danger data-delete-btn">删除</button>
        </div>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
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
        function showTime(tempDate)
        {
            var d = new Date(tempDate);
            var year = d.getFullYear();
            var month = d.getMonth();
            month++;
            var day = d.getDate();
            var hours = d.getHours();

            var minutes = d.getMinutes();
            var seconds = d.getSeconds();
            month = month<10 ? "0"+month:month;
            day = day<10 ? "0"+day:day;
            hours = hours<10 ? "0"+hours:hours;
            minutes = minutes<10 ? "0"+minutes:minutes;
            seconds = seconds<10 ? "0"+seconds:seconds;


            var time = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
            return time;
        }


        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/wheatImageController/findAll.do',
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"},
                {field: 'vid', width: 80, title: 'ID', sort: true},
                {field: 'imageName', width: 150, title: '图片名称', sort: true},
                {field: 'wheatType', width: 100, title: '品种', sort: true},
                {field: 'imagePath', width: 200, title: '图片路径'},
                {field: 'createTime', width: 300, title: '创建时间', sort: true,templet:function (d) {
                    return showTime(d.createTime);}},
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

        // 监听添加操作
        $(".data-add-btn").on("click", function () {

            layer.msg('添加数据');

            layer.open({
                type : 2,
                title : '新增菜单',
                area : [ '700px', '500px' ],
                shadeClose : true, // 点击遮罩关闭
                btn : ['保存','取消'],
                content : 'AddImage.jsp',
                success : function(layero, index) { // 成功弹出后回调
                },
                yes : function(index, layero) { // 保存按钮回调函数
                    var form = layer.getChildFrame('form', index);  //获取iframe页的DOM
                    //layer.msg($(form).serialize());
                    $.ajax({
                        url:'<%=request.getContextPath()%>/Menu?action=add',
                        type:'post',
                        dataType:'json',
                        data:$(form).serialize(),
                        success:function(data){
                            console.log(data);
                            layer.msg('新增成功');

                            table.reload('currentTableId', {
                                where: {}
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            }); //只重载数据

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
        });//end of add



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
            }
        });

    });
</script>
<script>

</script>

</body>
</html>