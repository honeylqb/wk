<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/jq-module/zyupload/zyupload-1.0.0.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
    <fieldset class="layui-elem-field layuimini-search">
        <legend>个人信息</legend>
    <div class="layuimini-main">
        <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
            <div class="layui-tab-item layui-show">
                <div class="layui-form layui-form-pane">
                    <form method="post">
                        <div class="layui-form-item"><input type="hidden" name="vid" id="vid"
                                                            value="${loginUserInfo.vid}">
                            <label for="userName" class="layui-form-label">用户姓名</label>
                            <div class="layui-input-inline"><input type="text" id="userName" name="userName"
                                                                   required="" lay-verify="required" value="${loginUserInfo.userName}"
                                                                   autocomplete="off" class="layui-input"></div>
                            <div class="layui-form-mid layui-word-aux"></div>
                        </div>
                        <div class="layui-form-item"><label for="userAccount" class="layui-form-label">用户账号</label>
                            <div class="layui-input-inline"><input  id="userAccount" name="userAccount" value="${loginUserInfo.userAccount}"
                                                                   required="" lay-verify="required" readonly
                                                                   autocomplete="off" class="layui-input"></div>
                            <div class="layui-form-mid layui-word-aux"></div>
                        </div>
                        <div class="layui-form-item"><label for="userPhone" class="layui-form-label">手机号</label>
                            <div class="layui-input-inline"><input  id="userPhone" name="userPhone"
                                                                   required="" lay-verify="phone" value="${loginUserInfo.userPhone}"
                                                                   autocomplete="off" class="layui-input"></div>
                        </div>
                        <div class="layui-form-item"><label for="email" class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline"><input type="text" id="email" name="email"
                                                                   required="" lay-verify="email" value="${loginUserInfo.email}"
                                                                   autocomplete="off" class="layui-input"></div>
                        </div>

                        <div class="layui-form-item">
                            <button class="layui-btn"  lay-submit=""  lay-filter="formDemo" id ="formDemo">提交</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>
    </fieldset>
    </div>
    <%@include file="../../main/footer.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/src/js/sliderVerify/sliderVerify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/src/js/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function () {
        var sliderVerify = layui.sliderVerify,
            form = layui.form;
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

        console.log("save111111--");
        var flag = true;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log("1----");

                //layer.msg(JSON.stringify(data.field));
                console.log("2----");

                if ($("#L_pass").val() != $("#L_repass").val()) {
                    layer.msg("两次新密码输入不一样");
                    return false;
                }
                if(flag){
                    updateUserInfo();
                }
            console.log("3----");
            return false;

            // break;
        });

        // $("#btnSave").css("pointer-events","none");
        var updateUserInfo =  function(){
            flag = false;
            var map =  {
                "vid":$("#vid").val(),
                "userName":$("#userName").val(),
                "userPhone":$("#userPhone").val(),
                "email":$("#email").val(),
                "oldPassword":$("#oldPassword").val(),
            }
            console.log("save------");
            $.ajax({
                url:"${pageContext.request.contextPath}/UserManageController/updateUserInfo.do",
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

                        layer.msg(data.msg);




                    }else{
                        layer.msg(data.msg);
                    }
                    flag = true;
                }
            });

        }


    })




</script>

</body>
</html>