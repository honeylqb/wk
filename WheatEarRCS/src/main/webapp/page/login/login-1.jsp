<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>

<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.2</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/login.css">
	  <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="layui-layout layui-layout-admin">
    <%@include file="../main/head.jsp" %>
</div>



    <div class="login layui-anim layui-anim-up">
        <div class="message">穗粒识别计数系统</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="username" id ="username" placeholder="账号/手机号/邮箱"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" id ="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>
    <%@include file="../main/footer.jsp" %>
    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });

                //登录函数
                function login(){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/UserManageController/userLogin.do",
                        data:JSON.stringify({"userAccount":$("#username").val(),"userPassword":$("#password").val()}),
                        type:"post",
                        dataType:"json",
                        contentType: "application/json; charset=utf-8",
                        success:function(data){
                            console.log(data);
                            console.log(data.data);
                            //alert();
                            var da = data;
                            if(data.code == 0){


                                window.location = '${pageContext.request.contextPath}/page/back/admin-back.jsp';


                            }else{
                                layer.msg(data.msg);
                            }
                        }
                    });

                }

              form.on('submit(login)', function(data){
                // alert(888)
                  data = data.field;
                  if (data.username == '') {
                      layer.msg('用户名不能为空');
                      return false;
                  }
                  if (data.password == '') {
                      layer.msg('密码不能为空');
                      return false;
                  }
                  if (data.captcha == '') {
                      layer.msg('验证码不能为空');
                      return false;
                  }
                  login();
                  // layer.msg('登录成功', function () {
                  //     window.location = '../admin-back.jsp';
                  // });
                  return false;

                layer.msg(JSON.stringify(data.field),function(){
                    location.href='index.html'
                });
                return false;
              });
            });
        })
    </script>
    <!-- 底部结束 -->
    <script>
    </script>
</body>
</html>