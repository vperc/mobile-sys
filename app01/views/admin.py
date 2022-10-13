from django.shortcuts import render,redirect
from app01 import models
from app01.utils.pagination import Pagination
from django import forms
from app01.utils.bootstrap import BootStrapModelForm
from django.core.validators import RegexValidator
from django.core.validators import ValidationError
from app01.utils.encrypt import md5

class AdminModelForm(BootStrapModelForm):
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )

    class Meta:
        model = models.Admin
        fields = ['username','password','confirm_password']
        widgets = {
            "password":forms.PasswordInput(render_value=True)
        }

    #加完密的数据
    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        md5_pwd = md5(pwd)

        #去数据库校验重置密码和新输入的是否一致
        exists = models.Admin.objects.filter(id=self.instance.pk,password=md5_pwd).exists()
        if exists:
            raise ValidationError("密码不能与以前的密码相同")

        return md5_pwd

    def clean_confirm_password(self):
        print(self.cleaned_data)
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if confirm != pwd:
            raise ValidationError("密码不一致")
        #返回什么,此字段以后保存到数据库就是什么。
        return confirm

class AdminEditModelForm(BootStrapModelForm):
    class Meta:
        model = models.Admin
        fields = ['username']

class AdminResetModelForm(BootStrapModelForm):
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )
    class Meta:
        model = models.Admin
        fields = ['password', 'confirm_password']
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    # 加完密的数据
    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        md5_pwd = md5(pwd)

        # 去数据库校验重置密码和新输入的是否一致
        exists = models.Admin.objects.filter(id=self.instance.pk, password=md5_pwd).exists()
        if exists:
            raise ValidationError("密码不能与以前的密码相同")

        return md5_pwd

    def clean_confirm_password(self):
        print(self.cleaned_data)
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if confirm != pwd:
            raise ValidationError("密码不一致")
        # 返回什么,此字段以后保存到数据库就是什么。
        return confirm

def admin_list(request):
    """管理员列表"""

    #检查用户是否已登录,已登录继续往下走。未登录,跳转回登录界面。
    #用户发来请求,获取cookie随机字符串,拿着随机字符串看看session中有没有。
    info_dict = request.session["info"]
    print(info_dict["id"])
    print(info_dict['name'])

    #搜索
    data_dict = {}
    search_data = request.GET.get('q', "")
    if search_data:
        data_dict["username__contains"] = search_data

    #根据搜索条件去数据库搜索
    queryset = models.Admin.objects.filter(**data_dict)

    #分页
    page_object = Pagination(request,queryset,page_size=8)
    context = {
        'queryset':page_object.page_queryset,
        'page_object':page_object.html(),
        'search_data':search_data,
    }

    return render(request,'admin_list.html',context)

def admin_add(request):
    """添加管理员"""
    title = "新建管理员"

    if request.method == "GET":
        form = AdminModelForm()
        return render(request,'change.html',{"form":form,"title":title})

    form = AdminModelForm(data=request.POST)
    if form.is_valid():

        form.save()
        return redirect('/admin/list/')

    return render(request,'change.html',{"form":form,"title":title})

def admin_edit(request,nid):
    """编辑管理员"""
    #对象 / None
    row_object = models.Admin.objects.filter(id=nid).first()
    if not row_object:
        # return redirect(request,'error.html',{"msg":"数据不存在"})
        return redirect('/admin/list/')

    title = "编辑管理员"

    if request.method == "GET":
        form = AdminEditModelForm(instance=row_object)
        return render(request, 'change.html', {"form": form, "title": title})

    form = AdminEditModelForm(data=request.POST,instance=row_object)
    if form.is_valid():
        form.save()
        return redirect('/admin/list/')

    return render(request, 'change.html', {"form": form, "title": title})

def admin_delete(request,nid):
    """删除管理员"""
    models.Admin.objects.filter(id=nid).delete()
    return redirect('/admin/list/')

def admin_reset(request,nid):
    """重置密码"""
    #对象 / None
    row_object = models.Admin.objects.filter(id=nid).first()
    if not row_object:
        return redirect('/admin/list/')

    title = "重置密码 - {}".format(row_object.username)

    if request.method == "GET":
        form = AdminResetModelForm()
        return render(request, 'change.html', {"form": form, "title": title})

    form = AdminResetModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.save()
        return redirect('/admin/list/')
    return render(request, 'change.html', {"form": form, "title": title})





