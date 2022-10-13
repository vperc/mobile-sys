from django.shortcuts import render
from django.http import JsonResponse

def chart_list(request):
    """ 数据统计页面 """
    return render(request,'chart_list.html')

def chart_bar(request):
    """构造柱状图的数据"""
    #数据可以去数据库中获取
    legend = ["韩超","刘东"]
    series_list = [
        {
            "name": '韩超',
            "type": 'bar',
            "data": [5, 20, 36, 66, 44, 80,30]
        },
        {
            "name": '刘东',
            "type": 'bar',
            "data": [5, 25, 40, 55, 77, 100,80]
        }
    ]
    x_axis = ['1月', '2月', '3月', '4月', '5月', '6月','7月']

    result = {
        "status":True,
        "data":{
            'legend':legend,
            'series_list':series_list,
            'x_axis':x_axis,
        }
    }
    return JsonResponse(result)

def chart_pie(request):
    """构造饼图的数据"""
    #数据可以去数据库中获取

    db_data_list = [
        {"value": 1048, "name": 'IT部门'},
        {"value": 735, "name": '运营'},
        {"value": 580, "name": '新媒体'},
    ]

    result = {
        "status":True,
        "data":db_data_list
    }
    return JsonResponse(result)

def chart_line(request):
    """构造折线图的数据"""

    # 数据可以去数据库中获取
    legend = ["上海", "福建"]
    series_list = [
        {
            "name": '上海',
            "type": 'line',
            "stack": 'Total',
            "data": [5, 20, 36, 66, 44, 80, 30]
        },
        {
            "name": '福建',
            "type": 'line',
            "stack": 'Total',
            "data": [5, 25, 40, 55, 77, 100, 80]
        }
    ]
    x_axis = ['1月', '2月', '3月', '4月', '5月', '6月', '7月']

    result = {
        "status": True,
        "data": {
            'legend': legend,
            'series_list': series_list,
            'x_axis': x_axis,
        }
    }
    return JsonResponse(result)

def highcharts(request):
    """highcharts示例"""

    # 数据可以去数据库中获取
    legend = ["上海", "福建"]
    series_list = [
        {
            "name": '上海',
            "type": 'line',
            "stack": 'Total',
            "data": [5, 20, 36, 66, 44, 80, 30]
        },
        {
            "name": '福建',
            "type": 'line',
            "stack": 'Total',
            "data": [5, 25, 40, 55, 77, 100, 80]
        }
    ]
    x_axis = ['1月', '2月', '3月', '4月', '5月', '6月', '7月']

    result = {
        "status": True,
        "data": {
            'legend': legend,
            'series_list': series_list,
            'x_axis': x_axis,
        }
    }
    return render(request,'highcharts.html')

































