import json
from django import forms
from django.shortcuts import render, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from app01 import models
from app01.utils.bootstrap import BootStrapModelForm
from django.forms.utils import ErrorDict
from app01.utils.pagination import Pagination

class TaskModelForm(BootStrapModelForm):
    class Meta:
        model = models.Task
        fields = "__all__"
        widgets = {
            "detail":forms.Textarea
        }

def task_list(request):
    """任务列表"""
    #去数据库获取所有的任务
    queryset = models.Task.objects.all().order_by('-id')
    page_object = Pagination(request,queryset,page_size=4)
    form = TaskModelForm()

    context = {
        "form":form,
        "queryset":page_object.page_queryset, #分页完的数据
        "page_string":page_object.html() #生成页码
    }
    return render(request, "task_list.html",context)

@csrf_exempt
def task_ajax(request):
    print(request.GET)
    print(request.POST)

    data_dict = {"status": True, 'data': [11, 22, 33, 44]}
    return HttpResponse(json.dumps(data_dict))

@csrf_exempt
def task_add(request):
    print(request.POST)

    form = TaskModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        data_dict = {"status": True}
        return HttpResponse(json.dumps(data_dict))

    data_dict = {"status": False,'error':form.errors}
    return HttpResponse(json.dumps(data_dict,ensure_ascii=False))