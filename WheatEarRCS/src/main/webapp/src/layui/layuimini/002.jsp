<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页二</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-cray {color:#ffb800!important;}
        .icon-blue {color:#1e9fff!important;}
        .icon-tip {color:#ff5722!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .layui-red {color:red}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
        .layuimini-notice:hover {background:#f6f6f6;}
        .layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
        .layuimini-notice-title,.layuimini-notice-label {
            padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
        .layuimini-notice-title {line-height:28px;font-size:14px;}
        .layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
    </style>
</head>
<body>

      <div class="layui-col-md12">
          <div class="layui-card">
              <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
              <div class="layui-card-body">
                  <div id="echarts-records" style="width: 100%;min-height:500px"></div>
             	 <div id="main" style="width: 600px;height:400px;"></div>
              </div>
          </div>
      </div>
              
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'layuimini','echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            layuimini = layui.layuimini,
            echarts = layui.echarts;

       

        /**
         * 报表功能
         */
        var myChart = echarts.init(document.getElementById('echarts-records'), 'walden');

        setTimeout(function () {

            option = {
                legend: {},
                tooltip: {
                    trigger: 'axis',
                    showContent: false
                },
                dataset: {
                    source: [
                        ['product', '2012', '2013', '2014', '2015', '2016', '2017'],
                        ['Matcha Latte', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
                        ['Milk Tea', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
                        ['Cheese Cocoa', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
                        ['Walnut Brownie', 55.2, 67.1, 69.2, 72.4, 53.9, 39.1]
                    ]
                },
                xAxis: {type: 'category'},
                yAxis: {gridIndex: 0},
                grid: {top: '55%'},
                series: [
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {
                        type: 'pie',
                        id: 'pie',
                        radius: '30%',
                        center: ['50%', '25%'],
                        label: {
                            formatter: '{b}: {@2012} ({d}%)'
                        },
                        encode: {
                            itemName: 'product',
                            value: '2012',
                            tooltip: '2012'
                        }
                    }
                ]
            };

            myChart.on('updateAxisPointer', function (event) {
                var xAxisInfo = event.axesInfo[0];
                if (xAxisInfo) {
                    var dimension = xAxisInfo.value + 1;
                    myChart.setOption({
                        series: {
                            id: 'pie',
                            label: {
                                formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                            },
                            encode: {
                                value: dimension,
                                tooltip: dimension
                            }
                        }
                    });
                }
            });

            myChart.setOption(option);

        });
        
        //echartsRecords.setOption(option);

      

        // 使用刚指定的配置项和数据显示图表。
       
        // echarts 窗口缩放自适应
        window.onresize = function(){
            echartsRecords.resize();
        }

    });
</script>
</body>
</html>
