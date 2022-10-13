import requests
from django.shortcuts import render, redirect
from django.core.validators import RegexValidator
from django.core.validators import ValidationError
from app01 import models
from django import forms
from django.utils.safestring import mark_safe
from app01.utils.pagination import Pagination
from app01.utils.bootstrap import BootStrapModelForm
from app01.utils.form import UserModelForm,PrettyModelForm,PrettyEditModelForm

def user_list(request):
    """用户管理"""
    # 获取所有的用户列表 [obj,obj,obj]
    queryset = models.UserInfo.objects.all()
    # for obj in queryset:
    #     print(obj.id, obj.name, obj.account, obj.create_time.strftime("%Y-%m-%d-%H-%M"),
    #           obj.gender, obj.get_gender_display(), obj.depart_id)

    page_object = Pagination(request,queryset,page_size=8)

    context = {
        "queryset": page_object.page_queryset,
        "page_string":page_object.html(),
    }

    return render(request, 'user_list.html', context)

def user_add(request):
    """添加用户(原始方法)"""

    if request.method == "GET":
        context = {
            'gender_choices': models.UserInfo.gender_choices,
            "depart_list": models.Department.objects.all()
        }
        return render(request, 'user_add.html', context)
    # return render(request, 'user_add.html', {"form":form})

    # Django组件
    # Form组件  /  ModelForm组件
    # 获取用户提交的数据(用户提交数据没有校验)
    user = request.POST.get('user')
    pwd = request.POST.get('pwd')
    age = request.POST.get('age')
    ac = request.POST.get('ac')
    ctime = request.POST.get('ctime')
    gender_id = request.POST.get('gd')
    depart_id = request.POST.get('dp')

    # 添加到数据库
    models.UserInfo.objects.create(name=user, password=pwd, age=age,
                                   account=ac, create_time=ctime,
                                   gender=gender_id, depart_id=depart_id)


    # 返回到用户列表页面
    return redirect("/user/list/")

def user_model_form_add(request):
    """添加用户（ModelForm版本）"""
    if request.method == "GET":
        form = UserModelForm()
        return render(request, 'user_model_form_add.html', {"form": form})

    # 用户POST提交数据,数据校验
    form = UserModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect('/user/list/')
    # 校验失败(在页面上显示错误信息)
    else:
        print(form.errors)
    return render(request, 'user_model_form_add.html', {"form": form})

def user_edit(request, nid):
    """编辑用户"""
    if request.method == "GET":
        # 根据ID去数据库获取要编辑的那一行数据
        row_object = models.UserInfo.objects.filter(id=nid).first()

        form = UserModelForm(instance=row_object)
        return render(request, 'user_edit.html', {'form': form})

    row_object = models.UserInfo.objects.filter(id=nid).first()
    form = UserModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        # 默认保存的是用户输入的所有数据,如果想要再用户输入以外增加一点值
        # form.instance.字段名 = 值
        form.save()
        return redirect('/user/list/')
    return render(request, 'user_edit.html', {"form": form})

def user_delete(request, nid):
    models.UserInfo.objects.filter(id=nid).delete()
    return redirect('/user/list/')