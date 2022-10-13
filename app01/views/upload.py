from django.shortcuts import render, HttpResponse, redirect
from django import forms
import os
from app01.utils.bootstrap import BootStrapForm, BootStrapModelForm
from app01 import models
# from django.conf import setting
import scrapy


def upload_list(request):
    if request.method == "GET":
        return render(request, 'upload_list.html')

    file_object = request.FILES.get("avatar")
    f = open(file_object.name, mode='wb')
    for chunk in file_object.chunks():
        f.write(chunk)
    f.close()

    return HttpResponse("...")


class UpForm(BootStrapForm):
    bootstrap_exclude_fields = ['img']

    name = forms.CharField(label="姓名")
    age = forms.IntegerField(label="年龄")
    img = forms.FileField(label="头像")


def upload_form(request):
    # static,存放静态文件的路径,包括:CSS,JS,项目图片
    # media,用户上传数据的目录

    title = "Form上传"
    if request.method == "GET":
        form = UpForm()
        return render(request, 'upload_form.html', {"form": form, "title": title})

    form = UpForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        # 1.读取图片内容,写入到文件夹中。并获取文件的路径
        image_object = form.cleaned_data.get('img')
        # file_path = "app01/static/img/{}".format(image_object.name)

        media_path = os.path.join(settings.MEDIA_ROOT, image_object.name)

        f = open(media_path, mode='wb')
        for chunk in image_object.chunks():
            f.write(chunk)
        f.close()

        # 2.将图片文件路径写入到数据库
        models.Boss.objects.create(
            name=form.cleaned_data['name'],
            age=form.cleaned_data['age'],
            img=media_path,
        )

        return HttpResponse("...")
    return render(request, 'upload_form.html', {"form": form, "title": title})


class UpModelForm(BootStrapModelForm):
    bootstrap_exclude_fields = ['img']

    class Meta:
        model = models.City
        fields = '__all__'
        #exclude = ("img",)
        labels = {
            "name":"名称",
            "count":"人口",
        }
        error_messages = {
            'name':{'required':"城市姓名不能为空"},
            'count': {'required': "人口不能为空"}
        }


def upload_modal_form(request):
    """上传文件和数据(modalForm)"""
    title = "ModelForm上传文件"
    if request.method == "GET":
        form = UpModelForm()
        return render(request, 'upload_form.html', {'form': form, 'title': title})

    form = UpModelForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return HttpResponse("成功")
    return render(request, 'upload_form.html', {'form': form, 'title': title})
