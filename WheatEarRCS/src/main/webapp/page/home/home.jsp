<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
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

<%--            <ul class="layui-nav left fast-add layui-hide-xs" lay-filter="">--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">+新增</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <!-- 二级菜单 -->--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">--%>
<%--                                <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">--%>
<%--                                <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">--%>
<%--                                <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.add_tab('在tab打开','member-list.html')">--%>
<%--                                <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>--%>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">--%>
<%--                                <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--            </ul>--%>

<%--            <ul class="layui-nav layui-layout-right" lay-filter=""  style="right: 15px;">--%>

<%--                <li class="layui-nav-item layui-hide-xs li"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>--%>
<%--                <li class="layui-nav-item layui-hide-xs layui-this li"><a href="${pageContext.request.contextPath}/page/home/home.jsp">穗粒识别</a></li>--%>
<%--                <li class="layui-nav-item layui-hide-xs li"><a href="">相关介绍</a></li>--%>
<%--                <li class="layui-nav-item layui-hide-xs li">--%>
<%--                    <a href="javascript:; ">能力开放</a>--%>
<%--                    <dl class="layui-nav-child "> <!-- 二级菜单 -->--%>
<%--                        <dd><a href="">1</a></dd>--%>
<%--                        <dd><a href="">2</a></dd>--%>
<%--                        <dd><a href="">3</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item layui-hide-xs li"><a href="">社区</a></li>--%>
<%--                <!--手机可见-->--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;"><span class="layui-hide-xs">所有版本</span><span class="layui-hide-sm layui-show-xs">所有栏目</span><span class="layui-nav-more"></span></a>--%>
<%--                    <dl class="layui-nav-child layui-anim layui-anim-upbit">--%>
<%--                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">--%>
<%--                            <a href="${pageContext.request.contextPath}/index.jsp" target="_blank">首页</a>--%>
<%--                        </dd>--%>
<%--                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">--%>
<%--                            <a href="${pageContext.request.contextPath}/page/home/home.jsp" target="_blank">穗粒识别</a>--%>
<%--                        </dd>--%>
<%--                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">--%>
<%--                            <a href="#" target="_blank">相关介绍</a>--%>
<%--                        </dd>--%>
<%--                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">--%>
<%--                            <a href="#" target="_blank">能力开放</a>--%>
<%--                        </dd>--%>
<%--                        <dd class="layui-hide-sm layui-show-xs" lay-unselect="">--%>
<%--                            <a href="#" target="_blank">社区</a>--%>
<%--                            <hr>--%>
<%--                        </dd>--%>
<%--                        <dd lay-unselect="">--%>
<%--                            <a href="#" target="_blank">V2.2--%>
<%--                                <span class="layui-badge-dot"></span></a>--%>
<%--                        </dd>--%>
<%--                        <dd lay-unselect="">--%>
<%--                            <a href="http://x.xuebingsi.com/x-admin/v2.1/" target="_blank">V2.1</a>--%>
<%--                        </dd>--%>
<%--                        <dd lay-unselect="">--%>
<%--                            <a href="http://x.xuebingsi.com/x-admin/v2.0/" target="_blank">V2.0</a>--%>
<%--                        </dd>--%>
<%--                        <dd lay-unselect="">--%>
<%--                            <a href="http://x.xuebingsi.com/x-admin/v1.1/" target="_blank">V1.1</a>--%>
<%--                        </dd>--%>
<%--                        <dd lay-unselect="">--%>
<%--                            <a href="http://x.xuebingsi.com/x-admin/v1.0/" target="_blank">V1.0</a>--%>
<%--                        </dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>

<%--                <li class="layui-nav-item  ">--%>
<%--                    <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>--%>
<%--                    <dl class="layui-nav-child layui-anim layui-anim-upbit">--%>
<%--                        <dd><a href="javascript:;">修改信息</a></dd>--%>
<%--                        <dd><a href="javascript:;">安全管理</a></dd>--%>
<%--                        <dd><a href="javascript:;">退了</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--            </ul>--%>

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
                <li class="layui-nav-item">
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
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav topHead" >
            <div id="side-nav">
                <ul id="nav">
                    <c:forEach items="${menuList}" var="parent">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li" lay-tips="${parent.menuName}">${parent.menuIcon}</i>
                                <cite>${parent.menuName}</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <c:if test="${not empty parent.childData}">
                                <c:forEach items="${parent.childData}" var="childData">
                                    <ul class="sub-menu">
                                        <li>
                                            <a onclick="xadmin.add_tab('${childData.menuName}','${pageContext.request.contextPath}${childData.menuLink}')">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>${childData.menuName}</cite></a>
                                        </li>
                                    </ul>
                                </c:forEach>


                            </c:if>

                        </li>

                    </c:forEach>










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
<script>
    //JavaScript代码区域

    layui.use(['element','jquery','layer'], function(){
        var element = layui.element;
        //登录函数
        var layer = layui.layer;
        var $     = layui.jquery;
        $(function(){
            showMenu();
        });

        function showMenu(){
            $.ajax({
                url:'${pageContext.request.contextPath}/MenuManageController/showMenuTree.do',
                // data:{"userNo":$("#userNo").val(),"password":$("#password").val()},
                type:"post",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    console.log(data.data);

                    //alert();

                    if(data.code == 0){
                        //alert("登录成龙");
                        //
                        //$(".layui-nav-child").append( "<dd><a target='mainFrame' href='${pageContext.request.contextPath}/page/sys_menu_list.jsp'>菜单管理</a></dd>");


                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        };
    });
</script>
<script>//百度统计可去掉
var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
    </body>

</html>