<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>小麦穗粒识别计数系统-注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/main.css">
    <style type="text/css">

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%@include file="../main/head.jsp" %>
</div>
<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20="">
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
				<li ><a href="${pageContext.request.contextPath}/page/login/login-2.jsp" >登入</li>
                <li class="layui-this">注册</a></li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form method="post">
<%--                             <div class="layui-form-item">--%>
<%--                                <label for="L_email" class="layui-form-label">手机</label>--%>
<%--                                <div class="layui-input-inline"><input type="text" id="L_phone" name="phone" required=""--%>
<%--                                                                       lay-verify="phone" autocomplete="off"--%>
<%--                                                                       class="layui-input"></div>--%>
<%--                            </div>--%>

<%--                            <div class="layui-form-item"><label for="L_vercode" class="layui-form-label">验证码</label>--%>
<%--                                <div class="layui-input-inline"><input type="text" id="L_vercode" name="vercode"--%>
<%--                                                                       required="" lay-verify="required"--%>
<%--                                                                       placeholder="请输入手机短信验证码" autocomplete="off"--%>
<%--                                                                       class="layui-input"></div>--%>
<%--                                <div class="layui-form-mid" style="padding: 0!important;">--%>
<%--                                    <button type="button" class="layui-btn layui-btn-normal" id="FLY-getvercode">获取验证码--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="layui-form-item"><input type="hidden" name="secret"
                                                                value="%E9%98%B2%E6%AD%A2%E5%B9%BF%E5%91%8A%E7%8B%97683316">
                                <label for="L_username" class="layui-form-label">账号</label>
                                <div class="layui-input-inline"><input type="text" id="username" name="username"
                                                                       required="" lay-verify="required" placeholder="请输入账号"
                                                                       autocomplete="off" class="layui-input"></div>
                                <div class="layui-form-mid layui-word-aux"></div>
                            </div>
                            <div class="layui-form-item"><label for="L_pass" class="layui-form-label">密码</label>
                                <div class="layui-input-inline"><input type="password" id="L_pass" name="pass"
                                                                       required="" lay-verify="required" placeholder="6到16个字符"
                                                                       autocomplete="off" class="layui-input"></div>
                                <div class="layui-form-mid layui-word-aux"></div>
                            </div>
                            <div class="layui-form-item"><label for="L_repass" class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline"><input type="password" id="L_repass" name="repass"
                                                                       required="" lay-verify="required"
                                                                       autocomplete="off" class="layui-input"></div>
                            </div>
							<div class="layui-form-item">
								<label class="layui-form-label">滑动验证</label>
								<div class="layui-input-inline">
									<div id="slider"></div>
								</div>
							</div>
                            <div class="layui-form-item" style="position: relative; left: -10px; height: 32px;"><input
                                    type="checkbox" name="agreement" lay-skin="primary" title="" checked="">
                                <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                                <a href="/instructions/terms.html" target="_blank"
                                   style="position: relative; top: 4px; left: 5px; color: #999;">同意用户服务条款</a></div>
                            <div class="layui-form-item">
                                <button class="layui-btn"  lay-submit=""  lay-filter="formDemo">立即注册</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../main/footer.jsp" %>

</div>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/src/js/sliderVerify/sliderVerify.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.config({
        base: '${pageContext.request.contextPath}/src/js/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function () {
        var sliderVerify = layui.sliderVerify,
            form = layui.form;
        var slider = sliderVerify.render({
            elem: '#slider'
        })
        console.log("save111111--");
        var flag = true;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log("1----");
            if (slider.isOk()) {//用于表单验证是否已经滑动成功
                //layer.msg(JSON.stringify(data.field));
                console.log("2----");

                if ($("#L_pass").val() != $("#L_repass").val()) {
                    layer.msg("两次密码输入不一样");
                    return false;
                }
                if(flag){
                    rigister();
                }
            }else{
                layer.msg("请先通过滑块验证");
            }

                //return false;
                //return true;



            console.log("3----");
            return false;

           // break;
        });



        // $("#btnSave").css("pointer-events","none");
       var rigister =  function(){
           flag = false;
           console.log("save------");
           $.ajax({
               url:"${pageContext.request.contextPath}/UserManageController/userRigister.do",
               data:JSON.stringify({"userAccount":$("#username").val(),"userPassword":$("#L_pass").val()}),
               type:"post",
               dataType:"json",
               contentType: "application/json; charset=utf-8",
               success:function(data){
                   console.log(data);
                   console.log(data.data);
                   //alert();
                   var da = data;
                   if(data.code == 0){

                       layer.msg(data.msg);

                       window.location = '../login/login-2.jsp';


                   }else{
                       layer.msg(data.msg);
                   }
               }
           });

       }


    })




</script>
</body>
</html>