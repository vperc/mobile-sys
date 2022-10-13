from io import BytesIO
from django import forms
from app01 import models
from django.views import View
from django.shortcuts import render,redirect,HttpResponse
from app01.utils.encrypt import md5
from app01.utils.code import check_code
from app01.utils.bootstrap import BootStrapForm
from app01.utils.bootstrap import BootStrapModelForm
from django.contrib.auth.models import User

class EnrollForm(forms.ModelForm):
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

class LoginForm(BootStrapForm):
    username = forms.CharField(
        label="用户名",
        widget=forms.TextInput,
        required=True
    )
    password = forms.CharField(
        label="密码",
        widget=forms.PasswordInput(render_value=True),
        required=True
    )
    code = forms.CharField(
        label="验证码",
        widget=forms.TextInput,
        required=True
    )

    # 加完密的数据
    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

    #     # 去数据库校验重置密码和新输入的是否一致
    #     exists = models.Admin.objects.filter(id=self.instance.pk, password=md5_pwd).exists()
    #     if exists:
    #         raise ValidationError("密码不能与以前的密码相同")
    #
    #     return md5_pwd
    #
    # def clean_confirm_password(self):
    #     print(self.cleaned_data)
    #     pwd = self.cleaned_data.get("password")
    #     confirm = md5(self.cleaned_data.get("confirm_password"))
    #     if confirm != pwd:
    #         raise ValidationError("密码不一致")
    #     # 返回什么,此字段以后保存到数据库就是什么。
    #     return confirm

def login(request):
    """登录"""
    if request.method == "GET":
        form = LoginForm()
        return render(request, 'login.html', {"form": form})

    form = LoginForm(data=request.POST)
    if form.is_valid():

        #验证码校验
        user_input_code = form.cleaned_data.pop('code')
        code = request.session.get('image_code',"")
        if code.upper() != user_input_code.upper():
            form.add_error("code", "验证码错误")
            return render(request, 'login.html', {'form': form})

        admin_object = models.Admin.objects.filter(**form.cleaned_data).first()
        if not admin_object:
           form.add_error("password","用户名或密码错误")
           return render(request,'login.html',{'form':form})

        #用户和密码正确
        #网站要生成一个随机字符串,写到浏览器用户的cookie中;在写入到session中;
        request.session["info"] = {'id':admin_object.id,'name':admin_object.username}
        #session7天免登录
        request.session.set_expiry(60*60*24*7)

        return redirect("/admin/list/")

    return render(request, 'login.html', {"form": form})

def image_code(request):
    """生成图片验证码"""

    #调用pillow函数,生成图片
    img,code_string = check_code()

    #写入到自己的session中,以便于后续获取验证码再进行校验
    request.session['image_code'] = code_string
    #给session设置60s超时
    request.session.set_expiry(60)

    stream = BytesIO()
    img.save(stream,'png')

    return HttpResponse(stream.getvalue())

def logout(request):
    """注销"""

    request.session.clear()

    return redirect('/login/')

def enroll(request):
    """注册"""
    if request.method == "GET":
        form = EnrollForm()
    else:
        form = EnrollForm(request.POST)
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(form.cleaned_data['password'])
            new_user.save()
            return redirect('/login/')

    return render(request,'enroll.html',{"form":form})




































