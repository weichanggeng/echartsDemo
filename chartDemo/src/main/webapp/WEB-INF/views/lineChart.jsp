<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折线图</title>
<link rel="stylesheet" type="text/css" 
	href="./statics/layui.css">
<script src="./statics/echarts.min.js"></script>
<script src="./statics/jquery.min.js"></script>
</head>
<body>
<div style="width:2000px;height:1800px;">
	<a href="./pieChart"><button type="button" class="layui-btn">扇形统计图</button></a>
	<a href="./barChart"><button type="button" class="layui-btn">柱状统计图</button></a>
	<a href="./lineChart"><button type="button" class="layui-btn">折线统计图</button></a>
	<div style="height: 400px" class="" id="lineChart"></div>
</div>

<script>
$(function () {
    //折线图
    var echartsA = echarts.init(document.getElementById('lineChart'));
    echartsA.setOption({

        title: {
            text: '学生成绩'
        },

        tooltip: {
            trigger: 'axis',
        },
        legend: {
            data: ['成绩']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            boundaryGap: true,
            data: []
        }],

        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '成绩',
            type: 'line',
            areaStyle: {normal: {}},
            data: [],
            itemStyle: {
                normal: {
                    color: '#59aea2'
                },
                emphasis: {}
            }
        }
        ]
    });

    echartsA.showLoading();

    var user = [];
    var score = [];

    $.ajax({
        type: 'post',
        async: true,
        url: '${pageContext.request.contextPath}/chart1',
        data: {},
        dataType: 'json',
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                	user.push(result[i].name);
                }
                for (var i = 0; i < result.length; i++) {
                	score.push(result[i].score);
                }

                echartsA.hideLoading();
                echartsA.setOption({
                    xAxis: {
                        type: 'category',
                        boundaryGap: true,
                        data: user
                    },
                    series: [{
                        name: '点击量',
                        type: 'line',
                        areaStyle: {normal: {}},
                        data: score,
                        itemStyle: {
                            normal: {
                                color: '#59aea2'
                            },
                            emphasis: {}
                        }
                    }
                    ]
                });
            }
        },
        error: function (errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            echartsA.hideLoading();
        }
    });
})
</script>
</body>
</html>