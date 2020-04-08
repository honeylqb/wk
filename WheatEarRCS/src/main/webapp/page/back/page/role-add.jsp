<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>添加角色</title>
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
            <form action="" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="roleName" class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="roleName" name="roleName" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="roleCode" class="layui-form-label">
                        <span class="x-red">*</span>角色编码
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="roleCode" name="roleCode" required="" lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="roleType" class="layui-form-label">
                        <span class="x-red">*</span>角色类型
                    </label>
                    <div class="layui-input-inline">
                        <select name="roleType" lay-filter="aihao">
                            <option value=""></option>
                            <option value="0">超级管理员</option>
                            <option value="1" >管理员</option>
                            <option value="2">普通用户</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        拥有权限
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                        <c:forEach items="${menuList}" var="parent">
<%--                            <c:if test="${ empty parent.childData}">--%>

<%--                            </c:if>--%>

<%--                            <c:if test="${not empty parent.childData}">--%>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="id[]" lay-skin="primary" lay-filter="father" title="${parent.menuName}" value="${parent.vid}">
                                    </td>

                                    <td>
                                        <div class="layui-input-block">
                                            <c:forEach items="${parent.childData}" var="childData">
                                            <input name="id[]" lay-skin="primary" type="checkbox" title="${childData.menuName}" value="${childData.vid}">
                                            </c:forEach>
                                        </div>
                                    </td>

                                </tr>
<%--                            </c:if>--%>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="roleDesc" class="layui-form-label">
                        描述
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="roleDesc" name="roleDesc" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="add">增加</button>
              </div>
            </form>
        </div>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data.field);

            var dataArr = [];
            $.each(data.field,function (i, n) {
                //组装数据
                if(i=="roleName"){

                }else if(i=="roleType"){

                }else if(i=="roleDesc"){

                }else if(i=="roleCode"){

                }else {
                    dataArr.push(n);
                }
                console.log( "Name: " + i + ", Value: " + n );

            })

              var map = {
                  "roleName" :data.field.roleName,
                "roleType" :data.field.roleType,
                  "roleCode" :data.field.roleCode,
                  "roleDesc" :data.field.roleDesc,
                  "roleMenuId" :dataArr


              };
            console.log("-0-======================");
            console.log(JSON.stringify(map));

              $.ajax({
                  url:"${pageContext.request.contextPath}/RoleManageController/addRole.do",
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
                          layer.alert("增加成功", {icon: 6},function () {
                              // 获得frame索引
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


        form.on('checkbox(father)', function(data){

            if(data.elem.checked){
                $(data.elem).parent().siblings('td').find('input').prop("checked", true);
                form.render(); 
            }else{
               $(data.elem).parent().siblings('td').find('input').prop("checked", false);
                form.render();  
            }
        });
          
          
        });
    </script>
  </body>

</html>