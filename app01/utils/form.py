from django.shortcuts import render, redirect
from django.core.validators import RegexValidator
from django.core.validators import ValidationError
from app01 import models
from django import forms
from django.utils.safestring import mark_safe
from app01.utils.pagination import Pagination
from app01.utils.bootstrap import BootStrapModelForm

class UserModelForm(BootStrapModelForm):
    name = forms.CharField(min_length=2, label="用户名",widget=forms.TextInput(attrs={"class":"form-control"}))

    # password =forms.CharField(label="密码",validators=)

    class Meta:
        model = models.UserInfo
        fields = ["name", "password", "age", "account", "create_time", "gender", "depart"]

class PrettyModelForm(BootStrapModelForm):
    # 验证:方式1 字段+正则表达式
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[3-9]\d{9}$', '手机格式错误'), ],
    )

    class Meta:
        model = models.PrettyNum
        fields = ['mobile', 'price', 'level', 'status']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            field.widget.attrs = {"class": "form-control", "placeholder": field.label}

    # 验证:方式2 钩子方法
    def clean_mobile(self):

        # # 当前编辑那一行的ID
        # print(self.instance.pk)

        txt_mobile = self.cleaned_data["mobile"]
        exists = models.PrettyNum.objects.exclude(id=self.instance.pk).filter(mobile=txt_mobile).exists()
        if exists:
            raise ValidationError("手机号已存在")

        # 验证通过,用户输入的值返回
        return txt_mobile
    # #验证:方式2 钩子方法
    # def clean_mobile(self):
    #
    #     txt_mobile = self.cleaned_data["mobile"]
    #     if len(txt_mobile) != 11:
    #         #验证不通过
    #         raise ValidationError("格式错误")
    #
    #     #验证通过,用户输入的值返回
    #     return txt_mobile

class PrettyEditModelForm(BootStrapModelForm):
    # mobile = forms.CharField(disabled=True,label="手机号")
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[3-9]\d{9}$', '手机格式错误'), ],
    )

    class Meta:
        model = models.PrettyNum
        fields = ['mobile', 'price', 'level', 'status']

    # 验证:方式2 钩子方法
    def clean_mobile(self):

        # # 当前编辑那一行的ID
        # print(self.instance.pk)

        txt_mobile = self.cleaned_data["mobile"]
        exists = models.PrettyNum.objects.exclude(id=self.instance.pk).filter(mobile=txt_mobile).exists()
        if exists:
            raise ValidationError("手机号已存在")

        # 验证通过,用户输入的值返回
        return txt_mobile