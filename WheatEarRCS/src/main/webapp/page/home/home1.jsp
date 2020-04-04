<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>小麦穗粒识别计数系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="../../src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../src/layui/X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
        <style type="text/css">
            .topHead{
                top: 59px;
            }

            .container .logo a {
                float: left;
                font-size: 18px;
                padding-left: 20px;
                line-height: 59px;
                width: 200px;
            }
            .container {
                width: 100%;
                height: 59px;
                background-color: #393D49;
            }

            .container .layui-nav-item{
                line-height: 59px;
            }
            .container .layui-nav-child {
                top: 59px;
            }

            .layui-nav * {
                font-size: 14px;
            }

            .x-admin-sm .layui-nav * {
                font-size: 14px;
            }

            .li{
                margin-left: 10px;
                margin-right: 10px;

            }



        </style>
    </head>
    <body class="index">
<%--        <%@include file="head.jsp" %>--%>
        <!-- 顶部开始 -->

        <div class="container" style=" height: 59px;">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.jsp" style=" height: 100%;">WheatEarRCS</a>
            </div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont layui-hide-xs" style="margin-top: 11px;">&#xe699;</i></a>
            </div>
            <ul class="layui-nav left fast-add layui-hide-xs" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">+新增</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
                                <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>
                        <dd>
                            <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">
                                <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>
                        <dd>
                            <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">
                                <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开','member-list.html')">
                                <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
                                <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>
                    </dl>
                </li>
            </ul>

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
                <li class="layui-nav-item layui-hide-xs li"><a href="">社区</a></li>
                <!--手机可见-->
                <li class="layui-nav-item">
                    <a href="javascript:;"><span class="layui-hide-xs">所有版本</span><span class="layui-hide-sm layui-show-xs">所有栏目</span><span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit">
                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">
                            <a href="${pageContext.request.contextPath}/index.jsp" target="_blank">首页</a>
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
                            <a href="#" target="_blank">社区</a>
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

                <li class="layui-nav-item  ">
                    <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit">
                        <dd><a href="javascript:;">修改信息</a></dd>
                        <dd><a href="javascript:;">安全管理</a></dd>
                        <dd><a href="javascript:;">退了</a></dd>
                    </dl>
                </li>
            </ul>
<%--               <%@include file="head.jsp" %>--%>

<%--            <ul class="layui-nav right" lay-filter="">--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">admin</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <!-- 二级菜单 -->--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a href="./login.html">退出</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item to-index">--%>
<%--                    <a href="/">前台首页</a></li>--%>
<%--            </ul>--%>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav topHead" >
            <div id="side-nav">
                <ul id="nav">

                    <li>
                        <a  <a onclick="xadmin.add_tab('个人信息','${pageContext.request.contextPath}/page/imageManage/wheetImage-list.jsp',true)">
                            <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6b8;</i>
                            <cite>个人中心</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>

                    </li>


                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="图片管理">&#xe6b8;</i>
                            <cite>图片管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('公共图片库','${pageContext.request.contextPath}/page/imageManage/wheetImage-list.jsp',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公共图片库</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('上传图片','${pageContext.request.contextPath}/page/imageManage/upload.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>上传图片</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('图片列表','${pageContext.request.contextPath}/page/imageManage/wheetImage-list2.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>图片列表</cite></a>
                            </li>


                            <li>
                                <a onclick="xadmin.add_tab('会员删除','member-del.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员删除</cite></a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe70b;</i>
                                    <cite>会员管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('会员删除','member-del.html')">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>会员删除</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('等级管理','member-list1.html')">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>等级管理</cite></a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="穗粒识别">&#xe723;</i>
                            <cite>穗粒识别</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('多级分类','${pageContext.request.contextPath}/page/imageManage/shibie.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>穗粒识别</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="城市联动">&#xe723;</i>
                            <cite>相关介绍</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('三级地区联动','city.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>三级地区联动</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
                            <cite>系统统计</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('拆线图','echarts1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>拆线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('拆线图','echarts2.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>拆线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('地图','echarts3.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>地图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('饼图','echarts4.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>饼图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('雷达图','echarts5.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>雷达图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('k线图','echarts6.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>k线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('热力图','echarts7.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>热力图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('仪表图','echarts8.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>仪表图</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="联系我们">&#xe6b4;</i>
                            <cite>图标字体</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('图标对应字体','unicode.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>图标对应字体</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                            <cite>其它页面</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="login.html" target="_blank">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>登录页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('错误页面','error.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>错误页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('示例页面','demo.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>示例页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('更新日志','log.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>更新日志</cite></a>
                            </li>
                        </ul>
                    </li>



                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content topHead" >
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='./welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>