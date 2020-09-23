layui.use(['layer', 'echarts'], function () {
    var $ = layui.jquery,
        echarts = layui.echarts;

    //树状图
    $.post(ctx + '/customer/countCusMake', function (data) {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('make'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '客户构成分析'
            },
            tooltip: {}, //鼠标在目标上显示产品
            legend: {
                data: ['客户数量'] //说明
            },
            xAxis: {
                data: data.level
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name: '客户数量',
                type: 'line',
                data: data.counts
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    }, 'json');

    //饼图
    $.post(ctx + '/customer/countCusMake/1', function (data) {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('make1'));
        // 指定图表的配置项和数据
        var option = {
            backgroundColor: '#2c343c',

            title: {
                text: '客户构成分析',
                left: 'center',
                top: 20,
                textStyle: {
                    color: '#ccc'
                }
            },

            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                left: 'center',
                top: 'bottom',
                data: data.data1
            },

            visualMap: {
                show: false,
                min: 80,
                max: 600,
                inRange: {
                    colorLightness: [0, 1]
                }
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '50%'],
                    data: data.data2.sort(function (a, b) {
                        return a.value - b.value;
                    }),
                    roseType: 'radius',
                    label: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    },
                    labelLine: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    },
                    itemStyle: {
                        color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },

                    animationType: 'scale',
                    animationEasing: 'elasticOut',
                    animationDelay: function (idx) {
                        return Math.random() * 200;
                    }
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    }, 'json');
})