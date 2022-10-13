from django.shortcuts import render, redirect
from django.core.validators import RegexValidator
from django.core.validators import ValidationError
from app01 import models
from django import forms
from django.utils.safestring import mark_safe
from app01.utils.pagination import Pagination
from app01.utils.bootstrap import BootStrapModelForm
from app01.utils.form import UserModelForm,PrettyModelForm,PrettyEditModelForm

def pretty_list(request):
    """靓号列表"""

    data_dict = {}
    search_data = request.GET.get('q', "")
    if search_data:
        data_dict["mobile__contains"] = search_data

    queryset = models.PrettyNum.objects.filter(**data_dict).order_by("-level")

    page_object = Pagination(request, queryset, page_size=10)

    context = {
        "queryset": page_object.page_queryset,
        "search_data": search_data,  # 分完页的数据
        "page_string": page_object.html(),  # 页码
    }

    return render(request, 'pretty_list.html', context)

    # #1.根据用户想要访问的页码,计算出起止位置
    # page = int(request.GET.get('page',1))
    # page_size = 10  #每页显示10条数据
    # start = (page - 1) * page_size
    # end = page * page_size
    #
    # #数据总条数
    # total_count = models.PrettyNum.objects.filter(**data_dict).order_by("-level").count()
    #
    # #总页码
    # total_page_count,div = divmod(total_count,page_size)
    # if div:
    #     total_page_count += 1

def pretty_add(request):
    """添加靓号"""
    if request.method == "GET":
        form = PrettyModelForm()
        return render(request, 'pretty_add.html', {"form": form})
    form = PrettyModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect('/pretty/list/')
    return render(request, 'pretty_add.html', {"form": form})

def pretty_edit(request, nid):
    """编辑靓号"""
    row_object = models.PrettyNum.objects.filter(id=nid).first()

    if request.method == "GET":
        form = PrettyEditModelForm(instance=row_object)
        return render(request, 'pretty_edit.html', {"form": form})

    form = PrettyEditModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.save()
        return redirect('/pretty/list/')

    return render(request, 'pretty_edit.html', {"form": form})

def pretty_delete(request, nid):
    models.PrettyNum.objects.filter(id=nid).delete()
    return redirect('/pretty/list/')
