<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>layout 后台大布局 - Layui</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css">

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




	<div class="fly-footer">
		<p>
			<a href="#">小麦穗粒识别计数 </a>2020 ©
			<a href="#"></a>
		</p>
		<p>
			<a href="#">毕业设计 </a>author@
			<a href="#">刘清斌</a>
		</p>
		<p>
			<a href="http://www.henau.edu.cn/" target="_blank" title="河南农业大学">河南农业大学</a>
			<a href="http://www.xuebingsi.com/" target="_blank" title="信管学院">信息与管理科学学院</a>
			<a href="http://www.baidu.com/" target="_blank" title="百度一下">百度一下</a>
		</p>
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