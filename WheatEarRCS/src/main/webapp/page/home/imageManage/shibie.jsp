<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>穗粒识别分析</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/X-admin/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/src/layui/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <button id="but" class="layui-btn">打印</button>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">

                <div class="layui-col-sm12 layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">图片</div>
                        <div class="layui-card-body" style="min-height: 300px;">
                            <div  class="layui-col-sm12" style="height: 300px;">
                                <img src="/${wheatImage}"  height=" 300px">
                            </div>

                        </div>
                    </div>
                </div>

                <div class="layui-col-sm12 layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">可视化显示</div>
                        <div  class="layui-card-body tu" style="min-height: 300px;">
                            <div id="main1" class="layui-col-sm12" style="height: 280px;"></div>

                        </div>
                    </div>
                </div>
                <div class="layui-col-sm12 layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">分析结果</div>
                        <div class="layui-card-body" style="min-height: 280px;">
                            <div  class="layui-col-sm12" style="height: 280px;">
                                <form class="layui-form layui-form-pane" action="">
                                <div class="layui-form-item">
                                    <label for="roleCode" class="layui-form-label">
                                        小麦穗
                                    </label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="roleCode" name="roleCode" required="" lay-verify="required"
                                               autocomplete="off" class="layui-input" readonly value="${metadata.Ears}">
                                    </div>
                                </div>
                                    <div class="layui-form-item">
                                        <label for="roleCode" class="layui-form-label">
                                            穗部籽粒
                                        </label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="roleCode" name="roleCode" required="" lay-verify="required"
                                                   autocomplete="off" class="layui-input" readonly value="${metadata.Spikelets}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="roleCode" class="layui-form-label">
                                            是否有芒
                                        </label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="roleCode" name="roleCode" required="" lay-verify="required"
                                                   autocomplete="off" class="layui-input" readonly value="${metadata.Awns}">
                                        </div>
                                    </div>

                                </form>
<%--                                <p>--%>
<%--                                <label class="layui-form-label">小麦穗：</label>--%>

<%--                                    ${metadata.Ears}--%>
<%--                                </p>--%>
<%--                                <p>--%>
<%--                                    <label class="layui-form-label">穗粒：</label>--%>

<%--                                    ${metadata.Spikelets}--%>

<%--                                </p>--%>
<%--                                <p>--%>
<%--                                    <label class="layui-form-label">是否有芒：</label>--%>

<%--                                    ${metadata.Awns}--%>

<%--                                </p>--%>

                            </div>

                        </div>
                    </div>
                </div>

<%--                <div class="layui-col-sm12 layui-col-md6">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-header">用户来源</div>--%>
<%--                        <div class="layui-card-body" style="min-height: 280px;">--%>
<%--                            <div id="main3" class="layui-col-sm12" style="height: 300px;"></div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="layui-col-sm12 layui-col-md6">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-header">硬盘使用量</div>--%>
<%--                        <div class="layui-card-body" style="min-height: 280px;">--%>
<%--                            <div id="main4" class="layui-col-sm12" style="height: 300px;"></div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
        </div>
        <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
        <script src="${pageContext.request.contextPath}/src/js/echarts.js"></script>
        <script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
            
            $(function () {
               $('#but').click(function () {
                   window.print();
               })
            });

            var myChart = echarts.init(document.getElementById('main1'));

            // 指定图表的配置项和数据
            var option = {
                grid: {
                    top: '5%',
                    right: '2%',
                    left: '1%',
                    bottom: '10%',
                    containLabel: true
                },
                xAxis: {
                    max: 2500,
                    min: 0
                },
                yAxis: {
                    max: -1400,
                    min: 0
                },
                series: [{
                    symbolSize: 10,
                    data: ${wheatData},

                    type: 'scatter'
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

        // // 基于准备好的dom，初始化echarts实例
        // var myChart = echarts.init(document.getElementById('main1'));
        //
        // // 指定图表的配置项和数据
        // var option = {
        //     grid: {
        //         top: '5%',
        //         right: '1%',
        //         left: '1%',
        //         bottom: '10%',
        //         containLabel: true
        //     },
        //     tooltip: {
        //         trigger: 'axis'
        //     },
        //     xAxis: {
        //         type: 'category',
        //         data: ['周一','周二','周三','周四','周五','周六','周日']
        //     },
        //     yAxis: {
        //         type: 'value'
        //     },
        //     series: [{
        //         name:'用户量',
        //         data: [820, 932, 901, 934, 1290, 1330, 1320],
        //         type: 'line',
        //         smooth: true
        //     }]
        // };
        //
        //
        // // 使用刚指定的配置项和数据显示图表。
        // myChart.setOption(option);

        // 基于准备好的dom，初始化echarts实例
        // var myChart = echarts.init(document.getElementById('main2'));
        //
        // // 指定图表的配置项和数据
        // var option = {
        //     tooltip : {
        //         trigger: 'axis',
        //         axisPointer: {
        //             type: 'cross',
        //             label: {
        //                 backgroundColor: '#6a7985'
        //             }
        //         }
        //     },
        //     grid: {
        //         top: '5%',
        //         right: '2%',
        //         left: '1%',
        //         bottom: '10%',
        //         containLabel: true
        //     },
        //     xAxis : [
        //         {
        //             type : 'category',
        //             boundaryGap : false,
        //             data : ['周一','周二','周三','周四','周五','周六','周日']
        //         }
        //     ],
        //     yAxis : [
        //         {
        //             type : 'value'
        //         }
        //     ],
        //     series : [
        //         {
        //             name:'PV',
        //             type:'line',
        //             areaStyle: {normal: {}},
        //             data:[120, 132, 101, 134, 90, 230, 210],
        //             smooth: true
        //         },
        //         {
        //             name:'UV',
        //             type:'line',
        //             areaStyle: {normal: {}},
        //             data:[45, 182, 191, 234, 290, 330, 310],
        //             smooth: true,
        //
        //         }
        //     ]
        // };
        //
        //
        // // 使用刚指定的配置项和数据显示图表。
        // myChart.setOption(option);


        // // 基于准备好的dom，初始化echarts实例
        // var myChart = echarts.init(document.getElementById('main3'));
        //
        // // 指定图表的配置项和数据
        // var option = {
        //     tooltip : {
        //         trigger: 'item',
        //         formatter: "{a} <br/>{b} : {c} ({d}%)"
        //     },
        //     legend: {
        //         orient: 'vertical',
        //         left: 'left',
        //         data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        //     },
        //     series : [
        //         {
        //             name: '访问来源',
        //             type: 'pie',
        //             radius : '55%',
        //             center: ['50%', '60%'],
        //             data:[
        //                 {value:335, name:'直接访问'},
        //                 {value:310, name:'邮件营销'},
        //                 {value:234, name:'联盟广告'},
        //                 {value:135, name:'视频广告'},
        //                 {value:1548, name:'搜索引擎'}
        //             ],
        //             itemStyle: {
        //                 emphasis: {
        //                     shadowBlur: 10,
        //                     shadowOffsetX: 0,
        //                     shadowColor: 'rgba(0, 0, 0, 0.5)'
        //                 }
        //             }
        //         }
        //     ]
        // };
        //
        //
        //
        // // 使用刚指定的配置项和数据显示图表。
        // myChart.setOption(option);
        //
        //  // 基于准备好的dom，初始化echarts实例
        // var myChart = echarts.init(document.getElementById('main4'));
        //
        // // 指定图表的配置项和数据
        // var option = {
        //     tooltip : {
        //         formatter: "{a} <br/>{b} : {c}%"
        //     },
        //     series: [
        //         {
        //             name: '硬盘使用量',
        //             type: 'gauge',
        //             detail: {formatter:'{value}%'},
        //             data: [{value: 88, name: '已使用'}]
        //         }
        //     ]
        // };
        // // 使用刚指定的配置项和数据显示图表。
        // myChart.setOption(option);
    </script>

    </body>
</html>