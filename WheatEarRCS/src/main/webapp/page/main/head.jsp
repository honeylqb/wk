<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
	<style type="text/css">

	</style>
</head>
<body >

	<div class="layui-header header header-store">
		<div class="layui-container">
			<div class="logo" style="color: #D0D1D3;font-size: 25px;font-weight: 400;left: 15px;">WheatEarRCS</div>

			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-right" lay-filter=""  style="right: 15px;">
			<c:forEach  items="${NavigationData}" var="li">
				<c:if test="${empty li.childData}">
				<li class="layui-nav-item layui-hide-xs li"><a href="${pageContext.request.contextPath}${li.menuLink}">${li.menuName}</a></li>
				</c:if>
				<c:if test="${not empty li.childData}">

						<li class="layui-nav-item layui-hide-xs li">
							<a href="javascript:; ">${li.menuName}</a>

							<dl class="layui-nav-child "> <!-- 二级菜单 -->
								<c:forEach var="childData" items="${li.childData}">
								<dd><a href="${pageContext.request.contextPath}${childData.menuLink}">${childData.menuName}</a></dd>
								</c:forEach>
							</dl>
						</li>
				</c:if>
			</c:forEach>
					<!--手机可见-->
					<li class="layui-nav-item layui-hide-sm layui-show-xs">
						<a href="javascript:;"><span class="layui-hide-xs">所有版本</span><span class="layui-hide-sm layui-show-xs">所有栏目</span><span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child layui-anim layui-anim-upbit">
							<c:forEach items="${NavigationData}" var="li" >
								<c:if test="${ empty li.childData}">
								<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
									<a href="${pageContext.request.contextPath}${li.menuLink}" target="_blank">${li.menuName}</a>
								</dd>
								</c:if>
								<c:if test="${not empty li.childData}">
									<dd lay-unselect="">
										<a href="#" target="_blank">${li.menuName}
											<span class="layui-badge-dot"></span></a>
									</dd>
									<c:forEach var="childData" items="${li.childData}">

										<dd lay-unselect="">
											<a href="${pageContext.request.contextPath}${childData.menuLink}" target="_blank">${childData.menuName}</a>
										</dd>
									</c:forEach>
								</c:if>
							</c:forEach>


						</dl>
					</li>
				<c:if test="${not empty loginUserInfo}">
					<li class="layui-nav-item  li">
						<a ><i class="iconfont">&#xe6b8;</i>${loginUserInfo.userName}</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;">修改信息</a></dd>
							<dd><a href="${pageContext.request.contextPath}/page/login/login-2.jsp">切换账号</a></dd>
							<dd><a href="${pageContext.request.contextPath}/UserManageController/loginExit.do">退了</a></dd>
						</dl>
					</li>
				</c:if>

				<c:if test="${empty loginUserInfo}">
					<li class="layui-nav-item  li">
						<a ><i class="iconfont">&#xe732;</i></a>
						<dl class="layui-nav-child">
							<dd><a href="${pageContext.request.contextPath}/page/login/login-2.jsp">登录</a></dd>
							<dd><a href="javascript:;">注册</a></dd>

						</dl>
					</li>
				</c:if>

			</ul>
		</div>





	</div>


<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script>
	layui.use(['carousel','element','layer'], function() {
		var carousel = layui.carousel

		var element = layui.element;
		var layer = layui.layer;


	});
</script>
</body>
</html>