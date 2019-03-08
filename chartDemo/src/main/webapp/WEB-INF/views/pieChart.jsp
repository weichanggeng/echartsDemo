<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>扇形图</title>
<link rel="stylesheet" type="text/css" 
	href="./statics/layui.css">
<script src="./statics/echarts.min.js"></script>
<script src="./statics/jquery.min.js"></script>
</head>
<body>
<div style="width:2000px;height:1800px;">
	<a href="./lineChart"><button type="button" class="layui-btn">折线统计图</button></a>
	<a href="./pieChart"><button type="button" class="layui-btn">扇形统计图</button></a>
	<a href="./barChart"><button type="button" class="layui-btn">柱状统计图</button></a>
	<div style="height: 400px" class="" id="pieChart"></div>
</div>

<script>
//扇形
$(function () {
    var echartsB = echarts.init(document.getElementById('pieChart'));
    echartsB.setOption({
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: []
        },
        series: [
            {
                name: '点击统计',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: []
            }
        ]
    });
    echartsB.showLoading();

    var user = [];

    $.ajax({
        type: 'post',
        async: 'true',
        url: '${pageContext.request.contextPath}/chart2',
        data: {},
        dataType: 'json',
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                	user.push(result[i].name)
                }
                echartsB.hideLoading();
                echartsB.setOption({
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: user
                    },
                    series: [
                        {
                            name: '点击统计',
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data: result
                        }
                    ]
                });
            }

        },
        error: function (errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            echartsB.hideLoading();
        }
    });
})
</script>
</body>
</html>