<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>小麦穗粒识别计数系统</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/main.css">
	<style type="text/css">

	</style>
</head>
<body >
<div class="layui-layout layui-layout-admin">
<%--	<jsp:include page="${pageContext.request.contextPath}/"></jsp:include>--%>
	<%@include file="../main/head.jsp" %>
</div>
<div class="layui-container fly-marginTop">
	<div class="fly-panel fly-panel-user" pad20="">
		<div class="layui-tab layui-tab-brief" lay-filter="user">
			<ul class="layui-tab-title">
				<li class="layui-this">登入</li>
				<li><a href="${pageContext.request.contextPath}/page/main/rigister.jsp">注册</a></li>
			</ul>
			<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
				<div class="layui-tab-item layui-show">
					<div class="layui-form layui-form-pane">
						<form method="post">
							<div class="layui-form-item">
								<input type="hidden" name="secret" value="%E9%98%B2%E6%AD%A2%E5%B9%BF%E5%91%8A%E7%8B%97454212">
								<label for="username" class="layui-form-label">账号</label>
								<div class="layui-input-inline">
									<input type="text" id="username" name="loginName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
<%--								<div class="layui-form-mid layui-word-aux"></div>--%>
							</div>

							<div class="layui-form-item">
								<label for="password" class="layui-form-label">密码</label>
								<div class="layui-input-inline"> <input type="password" id="password" name="pass" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">滑动验证</label>
								<div class="layui-input-inline">
									<div id="slider"></div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-inline">
									<button class="layui-btn" lay-submit lay-filter="formDemo">立即登录</button>
									<button type="reset" class="layui-btn layui-btn-primary">重置</button>
<%--									<span style="padding-left:20px;"> <a href="/user/forget">忘记密码？</a> </span>--%>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%--<jsp:include page="${pageContext.request.contextPath}/page/main/footer.jsp"></jsp:include>--%>
	<%@include file="../main/footer.jsp" %>

</div>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/src/js/sliderVerify/sliderVerify.js"></script>
<script>
	//一般直接写在一个js文件中
	layui.config({
		base: '${pageContext.request.contextPath}/src/js/sliderVerify/'
	}).use(['sliderVerify', 'jquery', 'form'], function() {
		var sliderVerify = layui.sliderVerify,
				form = layui.form;
		var slider = sliderVerify.render({
			elem: '#slider'
		})

		var flag = true;
		//监听提交
		form.on('submit(formDemo)', function(data) {
			if(slider.isOk()){//用于表单验证是否已经滑动成功
				//layer.msg(JSON.stringify(data.field));
				console.log(JSON.stringify(data.field));
				if(flag){
					login();
				}

			}else{
				layer.msg("请先通过滑块验证");
			}
			return false;
		});



		//登录函数
		function login(){
			flag = false;
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


						window.location = '../../index.jsp';


					}else{
						layer.msg(data.msg);
						 flag = true;
					}
				}
			});

		}


	})

</script>
</body>
</html>