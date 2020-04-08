<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>用户编辑</title>
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
                    <input type="hidden" name="vid" id="vid" value="${userRoleEdit.vid}"/>
                  <div class="layui-form-item">
                      <label for="username" class="layui-form-label">
                          <span class="x-red">*</span>用户名
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="username" name="username" required="" lay-verify="required"
                          autocomplete="off" class="layui-input" value="${userRoleEdit.userName}">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>系统使用昵称
                      </div>
                  </div>
                    <div class="layui-form-item">
                        <label for="userAccount" class="layui-form-label">
                            <span class="x-red">*</span>用户名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="userAccount" name="userAccount" required="" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${userRoleEdit.userAccount}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为您唯一的登入名
                        </div>
                    </div>

                  <div class="layui-form-item">
                      <label for="phone" class="layui-form-label">
                          <span class="x-red">*</span>手机
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                          autocomplete="off" class="layui-input" value="${userRoleEdit.userPhone}">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>将会成为您唯一的登入名
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="L_email" class="layui-form-label">
                          <span class="x-red">*</span>邮箱
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="L_email" name="email" required="" lay-verify="email"
                          autocomplete="off" class="layui-input" value="${userRoleEdit.email}">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label class="layui-form-label"><span class="x-red">*</span>角色</label>
                      <div class="layui-input-block">
                        <c:forEach items="${userRoleEdit.roleInfo}" var="item">
                            <c:if test="${item.checked == 'true'}">
                                <input type="checkbox" name="id[]" lay-skin="primary" title="${item.roleName}" value="${item.vid}" checked="">
                            </c:if>
                            <c:if test="${item.checked != 'true'}">
                            <input type="checkbox" name="id[]" lay-skin="primary" title="${item.roleName}" value="${item.vid}">
                            </c:if>
                        </c:forEach>
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="L_repass" class="layui-form-label">
                      </label>
                      <button  class="layui-btn" lay-filter="add" lay-submit="">
                          增加
                      </button>
                  </div>
              </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php
                    var dataArr = [];
                    $.each(data.field,function (i, n) {
                        //组装数据
                        if(i!="username"&&i!="phone"&&i!="pass"&&i!="repass"&&i!="email"&&i!="userAccount"&&i!="vid"){


                            dataArr.push(n);
                        }
                        console.log( "Name: " + i + ", Value: " + n );

                    })

                    var map = {
                        "vid":data.field.vid,
                        "userName" :data.field.username,
                        "userPhone" :data.field.phone,
                        "email" :data.field.email,
                        "roleIdArr" :dataArr
                    };
                    console.log("-0-======================");
                    console.log(JSON.stringify(map));

                    $.ajax({
                        url:"${pageContext.request.contextPath}/UserManageController/updateUser.do",
                        data:JSON.stringify(map),
                        type:"post",
                        dataType:"json",
                        contentType: "application/json; charset=utf-8",
                        success:function(data){
                            console.log(data);
                            console.log(data.data);
                            //alert();
                            var da = data;
                            if(data.code == 0){
                                // layer.msg(data.msg);
                                //发异步，把数据提交给php
                                layer.alert(data.msg, {
                                        icon: 6
                                    },
                                    function() {
                                        //关闭当前frame
                                        xadmin.close();

                                        // 可以对父窗口进行刷新
                                        xadmin.father_reload();
                                    });


                            }else{
                                layer.msg(data.msg);
                                flag = true;
                            }
                        }
                    });

                    return false;
                });

            });</script>

    </body>

</html>
