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
                  <div id="container" style="width: 100%;min-height:500px"></div>
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

       
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        var data = [
            [96.24, 11.35],
            [33.09, 85.11],
            [57.60, 36.61],
            [36.77, 27.26],
            [20.10, 6.72],
            [45.53, 36.37],
            [110.07, 80.13],
            [72.05, 20.88],
            [39.82, 37.15],
            [48.05, 70.50],
            [0.85, 2.57],
            [51.66, 63.70],
            [61.07, 127.13],
            [64.54, 33.59],
            [35.50, 25.01],
            [226.55, 664.02],
            [188.60, 175.31],
            [81.31, 108.68]
        ];

        // See https://github.com/ecomfe/echarts-stat
        var myRegression = ecStat.regression('polynomial', data, 3);

        myRegression.points.sort(function(a, b) {
            return a[0] - b[0];
        });

        option = {

            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            title: {
                text: '18 companies net profit and main business income (million)',
                subtext: 'By ecStat.regression',
                sublink: 'https://github.com/ecomfe/echarts-stat',
                left: 'center',
                top: 16
            },
            xAxis: {
                type: 'value',
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                splitNumber: 20
            },
            yAxis: {
                type: 'value',
                min: -40,
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                }
            },
            grid: {
                top: 90
            },
            series: [{
                name: 'scatter',
                type: 'scatter',
                label: {
                    emphasis: {
                        show: true,
                        position: 'right',
                        textStyle: {
                            color: 'blue',
                            fontSize: 16
                        }
                    }
                },
                data: data
            }, {
                name: 'line',
                type: 'line',
                smooth: true,
                showSymbol: false,
                data: myRegression.points,
                markPoint: {
                    itemStyle: {
                        normal: {
                            color: 'transparent'
                        }
                    },
                    label: {
                        normal: {
                            show: true,
                            position: 'left',
                            formatter: myRegression.expression,
                            textStyle: {
                                color: '#333',
                                fontSize: 14
                            }
                        }
                    },
                    data: [{
                        coord: myRegression.points[myRegression.points.length - 1]
                    }]
                }
            }]
        };;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }

        // 使用刚指定的配置项和数据显示图表。
       
        // echarts 窗口缩放自适应
        window.onresize = function(){
        	myChart.resize();
        }

    });
</script>
</body>
</html>
