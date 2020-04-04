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
        function getVirtulData(year) {
            year = year || '2017';
            var date = +echarts.number.parseDate(year + '-01-01');
            var end = +echarts.number.parseDate((+year + 1) + '-01-01');
            var dayTime = 3600 * 24 * 1000;
            var data = [];
            for (var time = date; time < end; time += dayTime) {
                data.push([
                    echarts.format.formatTime('yyyy-MM-dd', time),
                    Math.floor(Math.random() * 10000)
                ]);
            }
            return data;
        }

        var data = getVirtulData(2016);

        option = {
            backgroundColor: '#404a59',

            title: {
                top: 30,
                text: '2016年某人每天的步数',
                subtext: '数据纯属虚构',
                left: 'center',
                textStyle: {
                    color: '#fff'
                }
            },
            tooltip : {
                trigger: 'item'
            },
            legend: {
                top: '30',
                left: '100',
                data:['步数', 'Top 12'],
                textStyle: {
                    color: '#fff'
                }
            },
            calendar: [{
                top: 100,
                left: 'center',
                range: ['2016-01-01', '2016-06-30'],
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#000',
                        width: 4,
                        type: 'solid'
                    }
                },
                yearLabel: {
                    formatter: '{start}  1st',
                    textStyle: {
                        color: '#fff'
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#323c48',
                        borderWidth: 1,
                        borderColor: '#111'
                    }
                }
            }, {
                top: 340,
                left: 'center',
                range: ['2016-07-01', '2016-12-31'],
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#000',
                        width: 4,
                        type: 'solid'
                    }
                },
                yearLabel: {
                    formatter: '{start}  2nd',
                    textStyle: {
                        color: '#fff'
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#323c48',
                        borderWidth: 1,
                        borderColor: '#111'
                    }
                }
            }],
            series : [
                {
                    name: '步数',
                    type: 'scatter',
                    coordinateSystem: 'calendar',
                    data: data,
                    symbolSize: function (val) {
                        return val[1] / 500;
                    },
                    itemStyle: {
                        normal: {
                            color: '#ddb926'
                        }
                    }
                },
                {
                    name: '步数',
                    type: 'scatter',
                    coordinateSystem: 'calendar',
                    calendarIndex: 1,
                    data: data,
                    symbolSize: function (val) {
                        return val[1] / 500;
                    },
                    itemStyle: {
                        normal: {
                            color: '#ddb926'
                        }
                    }
                },
                {
                    name: 'Top 12',
                    type: 'effectScatter',
                    coordinateSystem: 'calendar',
                    calendarIndex: 1,
                    data: data.sort(function (a, b) {
                        return b[1] - a[1];
                    }).slice(0, 12),
                    symbolSize: function (val) {
                        return val[1] / 500;
                    },
                    showEffectOn: 'render',
                    rippleEffect: {
                        brushType: 'stroke'
                    },
                    hoverAnimation: true,
                    itemStyle: {
                        normal: {
                            color: '#f4e925',
                            shadowBlur: 10,
                            shadowColor: '#333'
                        }
                    },
                    zlevel: 1
                },
                {
                    name: 'Top 12',
                    type: 'effectScatter',
                    coordinateSystem: 'calendar',
                    data: data.sort(function (a, b) {
                        return b[1] - a[1];
                    }).slice(0, 12),
                    symbolSize: function (val) {
                        return val[1] / 500;
                    },
                    showEffectOn: 'render',
                    rippleEffect: {
                        brushType: 'stroke'
                    },
                    hoverAnimation: true,
                    itemStyle: {
                        normal: {
                            color: '#f4e925',
                            shadowBlur: 10,
                            shadowColor: '#333'
                        }
                    },
                    zlevel: 1
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        // echarts 窗口缩放自适应
        window.onresize = function(){
        	myChart.resize();
        }
    });
</script>
</body>
</html>
