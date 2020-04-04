<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>小麦穗粒识别计数系统</title>
	<link rel="stylesheet" href="./src/layui/layuimini/lib/layui-v2.5.4/css/layui.css">

	<style type="text/css">

		.li{
			margin-left: 10px;
			margin-right: 10px;

		}

		.fly-footer {
			margin: 50px 0 0;
			padding: 20px 0 30px;
			line-height: 30px;
			text-align: center;
			color: #737573;
			border-top: 1px solid #e2e2e2;
		}
		div {
			display: block;
		}

		.shop-nav .input-search {
			width: 100%;
			padding: 30px 0 10px;
			text-align: center;
			background-color: #FFF;
		}

		.shop-nav .input-search dl dd, .shop-nav .input-search dl dt {
			display: inline-block;
			color: #9495a4;
		}
		.shop-nav .input-search dl {
			position: relative;
			text-align: left;
			font-size: 12px;
			line-height: 30px;
			top: 5px;
			left: 10px;
		}
		.shop-nav .input-search {
			width: 100%;
			padding: 30px 0 10px;
			text-align: center;
			background-color: #FFF;
		}


		.header {
			height: 59px;
			border-bottom: 1px solid #404553;
			background-color: #393D49;
		}
		.header .layui-container .logo {
			left: 15px;
		}
		@media screen and (max-width: 750px)
			.logo, .header-demo .logo {
				left: 10px;
			}
			.logo {
				position: absolute;
				left: 0;
				top: 16px;
			}
		.header .layui-container .layui-nav {
			right: 15px;
		}
			.header .layui-nav {
				position: absolute;
				right: 0;
				top: 0;
				padding: 0;
				background: none;
			}
			.iconfont {
				font-family: "iconfont" !important;
				font-size: 16px;
				font-style: normal;
				-webkit-font-smoothing: antialiased;
				-moz-osx-font-smoothing: grayscale;
			}
			.icontouxiang:before {
				content: "\e65f";
			}

			.web-font-desc {
				font-family: "webfont-desc" !important;
				font-size: 61px;
				-webkit-font-smoothing: antialiased;
				-moz-osx-font-smoothing: grayscale;
			}

			.site-download {
				margin-top: 80px;
				font-size: 0;
			}
		html{background-color: #F2F2F2;}
	<!--开启网页上下滚动-->
		html,body{ overflow-x: hidden; }

			*{margin:0;padding:0;border:0;}
			html,body{font:14px/21px "HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;	text-align:center;
				filter: progid:DXImageTransform.Microsoft.gradient(enabled=true，GradientType:0,startColorstr='#094da1', endColorstr='#084ca0');
				color: #000000;
				-webkit-font-smoothing: antialiased;
				-webkit-text-size-adjust: 100%;
			}

			#nav li  .txt{line-height:227%;font-weight:bold;display:inline-block;white-space:nowrap;word-break: keep-all;-moz-text-shadow: 1px 1px 1px rgba(0,0,0,0.8); -webkit-text-shadow:1px 1px 1px rgba(0,0,0,0.8);
				text-shadow: 1px 1px 1px rgba(0,0,0,0.8);
				vertical-align:middle}

			@media only screen and (max-width:320px)
			{

				.txt{font-size:110%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size: 110%;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}
			@media only screen and (min-width: 321px) and (max-width: 360px)
			{

				.txt{font-size:120%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size: 120%;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}
			@media only screen and (min-width: 361px) and (max-width: 480px)
			{

				.txt{font-size:155%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size: 155%;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}
			@media only screen and (min-width: 481px) and (max-width: 570px)
			{

				.txt{font-size:180%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size:180;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}
			@media only screen and (min-width: 571px) and (max-width: 640px)
			{
				.txt{font-size:500%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size: 210%;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}
			@media only screen and (min-width: 641px)
			{

				.txt{font-size:310%;}
				.web-font-desc {
					font-family: "webfont-desc" !important;
					font-size: 500%;
					-webkit-font-smoothing: antialiased;
					-moz-osx-font-smoothing: grayscale;
				}

			}

	</style>
</head>
<body >
<div class="layui-layout layui-layout-admin">
	<div class="layui-header header header-store">
		<div class="layui-container">
			<div class="logo" style="color: #D0D1D3;font-size: 30px;font-weight: 400;left: 15px;">WheatEarRCS</div>

			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-right" lay-filter=""  style="right: 15px;">

				<li class="layui-nav-item layui-hide-xs li"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
				<li class="layui-nav-item layui-hide-xs layui-this li"><a href="${pageContext.request.contextPath}/page/home/home.jsp">穗粒识别</a></li>
				<li class="layui-nav-item layui-hide-xs li"><a href="">相关介绍</a></li>
				<li class="layui-nav-item layui-hide-xs li">
					<a href="javascript:; ">能力开放</a>
					<dl class="layui-nav-child "> <!-- 二级菜单 -->
						<dd><a href="">1</a></dd>
						<dd><a href="">2</a></dd>
						<dd><a href="">3</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-hide-xs li"><a href="${pageContext.request.contextPath}/page/back/admin-back.jsp">后台</a></li>
				<!--手机可见-->
				<li class="layui-nav-item">
					<a href="javascript:;"><span class="layui-hide-xs">所有版本</span><span class="layui-hide-sm layui-show-xs">所有栏目</span><span class="layui-nav-more"></span></a>
					<dl class="layui-nav-child layui-anim layui-anim-upbit">
						<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
							<a href="#" target="_blank">首页</a>
						</dd>
						<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
							<a href="${pageContext.request.contextPath}/page/home/home.jsp" target="_blank">穗粒识别</a>
						</dd>
						<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
							<a href="#" target="_blank">相关介绍</a>
						</dd>
						<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
							<a href="#" target="_blank">能力开放</a>
						</dd>
						<dd class="layui-hide-sm layui-show-xs" lay-unselect="">
							<a href="${pageContext.request.contextPath}/page/back/admin-back.jsp" target="_blank">后台</a>
							<hr>
						</dd>
						<dd lay-unselect="">
							<a href="#" target="_blank">V2.2
								<span class="layui-badge-dot"></span></a>
						</dd>
						<dd lay-unselect="">
							<a href="http://x.xuebingsi.com/x-admin/v2.1/" target="_blank">V2.1</a>
						</dd>
						<dd lay-unselect="">
							<a href="http://x.xuebingsi.com/x-admin/v2.0/" target="_blank">V2.0</a>
						</dd>
						<dd lay-unselect="">
							<a href="http://x.xuebingsi.com/x-admin/v1.1/" target="_blank">V1.1</a>
						</dd>
						<dd lay-unselect="">
							<a href="http://x.xuebingsi.com/x-admin/v1.0/" target="_blank">V1.0</a>
						</dd>
					</dl>
				</li>

				<li class="layui-nav-item  li">
					<a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;">修改信息</a></dd>
						<dd><a href="javascript:;">安全管理</a></dd>
						<dd><a href="javascript:;">退了</a></dd>
					</dl>
				</li>
			</ul>
		</div>





	</div>

	<!--滚动图片-->
	<div class="shop-nav shop-index">
		<div class="shop-banner">
			<div class="layui-carousel" lay-filter="LAY-store-banner" id="LAY-store-banner" style="background: rgb(242, 230, 214); width: 100%; height: 460px;" lay-anim="fade" lay-indicator="inside" lay-arrow="hover">
				<div carousel-item="">
<%--					<div style="background: #E7E6EE" class="layui-carousel-next layui-carousel-left layui-this">--%>
<%--						<div class="layui-container">--%>
<%--							<a href="#" target="_blank"><img src="" alt="小麦穗粒识别计数系统"></a>--%>
<%--						</div>--%>
<%--					</div>--%>
					<div style="background: #E7E6EE" class="layui-carousel-next layui-carousel-left layui-this">
						<div class="layui-container" style=" margin-top: 15%;">
							<p class="web-font-desc">小麦穗粒识别计数系统</p>
						</div>
					</div>
					<div style="background: #040227" class="layui-this layui-carousel-left">
						<div class="layui-container" style=" margin-top: 15%;">
							<p class="web-font-desc">小麦穗粒识别计数系统</p>
						</div>
					</div>


				</div>
				<div class="layui-carousel-ind">
					<ul>
						<li class="layui-this"></li>
						<li></li>
					</ul>
				</div><button class="layui-icon layui-carousel-arrow" lay-type="sub"></button>
				<button class="layui-icon layui-carousel-arrow" lay-type="add"></button></div>
		</div>

		<div id="LAY-topbar" style="height: auto;">
			<div class="input-search">
				<div>
					<dl class="layui-hide-sm layui-show-md-inline-block"><dt>开源项目进展：</dt>
						<dd>
							<a href="#"><img src="./X-admin-index/star.svg" alt="star"></a>
						</dd>
						<dd>
							<a href="#"><img src="./X-admin-index/fork.svg" alt="fork"></a>
						</dd>
						<dd>
							<a href="#" style="color: #FF5722;">更新日志</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>

	<div class="fly-footer">
		<p>
			<a href="http://x.xuebingsi.com/">小麦穗粒识别计数 </a>2020 ©
			<a href="http://x.xuebingsi.com/">x.xuebingsi.com</a>
		</p>
		<p>
			<a href="#">毕业设计 </a>author@
			<a href="#">刘清斌</a>
		</p>
		<p>
			<a href="http://www.daniuit.com/" target="_blank" title="河南农业大学">河南农业大学</a>
			<a href="http://www.xuebingsi.com/" target="_blank" title="信管学院">信管学院</a>
			<a href="http://www.baidu.com/" target="_blank" title="百度一下">百度一下</a>
		</p>
	</div>


<%--	<div class="layui-body">--%>
<%--		<!-- 内容主体区域 -->--%>
<%--		<div style="padding: 15px;">内容主体区域</div>--%>
<%--	</div>--%>

<%--	<div class="layui-footer">--%>
<%--		<!-- 底部固定区域 -->--%>
<%--		© layui.com - 底部固定区域--%>
<%--	</div>--%>
</div>
<script src="./src/layui/layuimini/lib/layui-v2.5.4/layui.all.js"></script>
<script src="./src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script>
	layui.use(['carousel','element','layer'], function() {
		var carousel = layui.carousel

		var element = layui.element;
		var layer = layui.layer;


		var elemBanner = $('#LAY-store-banner'),
				ins1 = carousel.render({
					elem: elemBanner,
					width: '100%',
					height: elemBanner.height() + 'px',
					interval: 6000,
					anim: 'default', //default（左右切换）updown（上下切换）fade（渐隐渐显切换）
					arrow: 'always', //始终显示箭头
					//full:'false',
					//autoplay: 'true',
					//autoplay: 'false',
					interval: '1000',
					index: '0'
				});
		$(window).on('resize', function() {
			var width = $(this).prop('innerWidth');
			ins1.reload({
				height: (width > 768 ? 460 : 115) + 'px'
			});
		});
		//监听轮播切换事件
		carousel.on('change(LAY-store-banner)', function(obj) {
			$('.shop-banner').css('background', obj.item.data('color'));
		});

	});
</script>
</body>
</html>