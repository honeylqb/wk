<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-穗粒识别系统</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎您：
                                <span class="x-red">${loginUserInfo.userName}!</span><span id="myclock"></span>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">数据统计</div>
                        <div class="layui-card-body ">
                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li class="layui-col-sm6 layui-col-md3">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>在线总人数</h3>
                                        <p>
                                            <cite id = "onlineTotal">66</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-sm6 layui-col-md3">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>你使用次数</h3>
                                        <p>
                                            <cite >12</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-sm6 layui-col-md3">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>你上传了图片</h3>
                                        <p>
                                            <cite>2</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-sm6 layui-col-md3">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>图片数</h3>
                                        <p>
                                            <cite>67</cite></p>
                                    </a>
                                </li>


                            </ul>
                        </div>
                    </div>

                </div>


                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>xxx版本</th>
                                        <td>1.0.180420</td></tr>
                                    <tr>
                                        <th>服务器地址</th>
                                        <td>x.xuebingsi.com</td></tr>
                                    <tr>
                                        <th>操作系统</th>
                                        <td>WINNT、LINUX</td></tr>
                                    <tr>
                                        <th>运行环境</th>
                                        <td>JAVA8 TOMCAT8</td></tr>
                                    <tr>
                                        <th>java版本</th>
                                        <td>1.8</td></tr>
                                    <tr>
                                        <th>MYSQL版本</th>
                                        <td>5.5.53</td></tr>
                                    <tr>
                                        <th>ThinkPHP</th>
                                        <td>5.0.18</td></tr>
                                    <tr>
                                        <th>上传附件限制</th>
                                        <td>2M</td></tr>
                                    <tr>
                                        <th>执行时间限制</th>
                                        <td>30s</td></tr>
                                    <tr>
                                        <th>剩余空间</th>
                                        <td>86015.2M</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">开发团队</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>版权所有</th>
                                        <td>xuebingsi(xuebingsi)
                                            <a href="http://x.xuebingsi.com/" target="_blank">访问官网</a></td>
                                    </tr>
                                    <tr>
                                        <th>开发者</th>
                                        <td>刘清斌(113664000@qq.com)</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style id="welcome_style"></style>
                <div class="layui-col-md12">
                    <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery提供技术支持。</blockquote>
                </div>

            </div>
        </div>
        </div>
<%--        <jsp:include page="${pageContext.request.contextPath}/page/main/footer.jsp"></jsp:include>--%>
        <script src="${pageContext.request.contextPath}/src/layui/X-admin/js/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                disptime();
                showCount();
            });
            function disptime(){
                var today = new Date();  		//获得当前时间
                var hh = today.getHours();	//获得小时、分钟、秒
                var mm = today.getMinutes();//获得分钟
                var ss = today.getSeconds();//获得秒
                /*设置div的内容为当前时间*/
                document.getElementById("myclock").innerHTML="现在时间:"+hh +":"+mm+": "+ss;
            }
            //登录函数
            function showCount(){

                $.ajax({
                    url:"${pageContext.request.contextPath}/IndexController/showCount.do",
                    data:JSON.stringify({"userAccount":$("#username").val(),"userPassword":$("#password").val()}),
                    type:"post",
                    dataType:"json",
                    contentType: "application/json; charset=utf-8",
                    success:function(data){
                        // console.log(data);
                        // console.log(data.data);
                        //alert();
                        var da = data;
                        if(data.code == 0){


                            document.getElementById("onlineTotal").innerHTML=data.data.onlineTotal;

                        }else{


                        }
                    }
                });

            }

            /*使用setInterval()每间隔指定毫秒后调用disptime()*/
            var myTime = setInterval("disptime()",1000);
            var myshowCount = setInterval("showCount()",1000);



        </script>
    </body>
</html>