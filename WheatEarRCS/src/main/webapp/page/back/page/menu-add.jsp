<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>用户添加</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <input type="hidden" name="vid" id="vid"/>
                  <div class="layui-form-item">
                      <label for="menuName" class="layui-form-label">
                          <span class="x-red">*</span>菜单名称
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="menuName" name="menuName" required="" lay-verify="required"
                          autocomplete="off" class="layui-input">
                      </div>
                  </div>
                    <div class="layui-form-item">
                        <label for="menuIcon" class="layui-form-label">
                            <span class="x-red">*</span>菜单图标
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="menuIcon" name="menuIcon" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label for="menuLink" class="layui-form-label">
                            <span class="x-red">*</span>菜单URL
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="menuLink" name="menuLink" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label for="menuType" class="layui-form-label">
                            <span class="x-red">*</span>菜单类型
                        </label>
                        <div class="layui-input-inline">
                            <select name="menuType" id="menuType" lay-filter="menuType">
                                <option value="2">普通菜单</option>
                                <option value="3" >按钮</option>
                                <option value="1">导航</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="parentId" class="layui-form-label">
                            <span class="x-red">*</span>父菜单
                        </label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="editParentId" id="editParentId"/>
                            <select name="parentId" id="parentId" lay-filter="parentId">
                                <option value=""></option>
                                <option value="-1">父菜单</option>

                            </select>
                        </div>
                    </div>
                  <div class="layui-form-item">
                      <label for="menuOrder" class="layui-form-label">
                          <span class="x-red">*</span>菜单顺序
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="menuOrder" name="menuOrder" required=""
                          autocomplete="off" class="layui-input">
                      </div>

                  </div>

                    <div class="layui-form-item">
                        <label for="isEnable" class="layui-form-label">
                            <span class="x-red">*</span>是否启用
                        </label>
                        <div class="layui-input-inline">
                            <select name="isEnable" id="isEnable">
                                <option value="1">是</option>
                                <option value="0" >否</option>
                            </select>
                        </div>
                    </div>

              </form>
            </div>
        </div>
        <script>
            layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                form.on("select(menuType)",function(data){
                    console.log("data+++++"+data.value)
                    showParent();
                    //alert()

                });
                 showParent();

                //查询父菜单的值


        function showParent(){
            var menuType = $('#menuType').val()
            if(menuType=='3'){
                menuType = '';
            }

            $.ajax({
                url:'${pageContext.request.contextPath}/MenuManageController/findMenuParentSelect.do',
                type:'post',
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                //async: true,
                data:JSON.stringify({"menuType":menuType}),
                success:function(data){
                    console.log(data);
                    temp = data.data ;
                    $("#parentId").html("<option value='-1'>父菜单</option>");
                    //jquery中隐式迭代
                    $.each(temp,function(index,item){
                        var option = new Option(item.menuName,item.vid);
                        //编辑页面显示选中的条目

                        if(item.vid ==  $("#editParentId").val()) {
                            option.setAttribute("selected",'true');
                        }//end of if
                        $('#parentId').append(option);//往下拉菜单里添加元素
                        form.render('select'); //这个很重要
                    })//end of each
                }//end of success
            });//end of ajax


        };



            });

        </script>

    </body>

</html>
