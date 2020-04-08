<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>穗粒识别</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/jq-module/zyupload/zyupload-1.0.0.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
    <fieldset class="layui-elem-field layuimini-search">
        <legend>重置密码</legend>
    <div class="layuimini-main">
        <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
            <div class="layui-tab-item layui-show">
                <div class="layui-form layui-form-pane">
                    <form method="post">
                        <div class="layui-form-item"><input type="hidden" name="secret"
                                                            value="%E9%98%B2%E6%AD%A2%E5%B9%BF%E5%91%8A%E7%8B%97683316">
                            <label for="L_username" class="layui-form-label">旧密码</label>
                            <div class="layui-input-inline"><input type="text" id="oldPassword" name="oldPassword"
                                                                   required="" lay-verify="required" placeholder="请输入账号"
                                                                   autocomplete="off" class="layui-input"></div>
                            <div class="layui-form-mid layui-word-aux"></div>
                        </div>
                        <div class="layui-form-item"><label for="L_pass" class="layui-form-label">新密码</label>
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
                    reSetPassword();
                }
            console.log("3----");
            return false;

            // break;
        });

        // $("#btnSave").css("pointer-events","none");
        var reSetPassword =  function(){
            flag = false;
            console.log("save------");
            $.ajax({
                url:"${pageContext.request.contextPath}/UserManageController/reSetPassword.do",
                data:JSON.stringify({"oldPassword":$("#oldPassword").val(),"userPassword":$("#L_pass").val(),"rePassword":$("#L_repass").val()}),
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

                      //  window.location = '../login/login-2.jsp';


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