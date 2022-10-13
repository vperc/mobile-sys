from django.shortcuts import render
import random
from app01 import models
from app01.utils.bootstrap import BootStrapModelForm
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from datetime import datetime
from app01.utils.pagination import Pagination

class OrderModelForm(BootStrapModelForm):
    class Meta:
        model = models.Order
        #fields = "__all__"
        exclude = ["oid","admin"]

def order_list(request):
    queryset = models.Order.objects.all().order_by('-id')
    page_object = Pagination(request,queryset,page_size=12)
    form = OrderModelForm()

    context = {
        "form":form,
        "queryset":page_object.page_queryset, #分页完的数据
        "page_string":page_object.html() #生成页码
    }

    return render(request,'order_list.html',context)

@csrf_exempt
def order_add(request):
    """新建订单(ajax请求)"""
    form = OrderModelForm(data=request.POST)
    if form.is_valid():
        # 格外增加一些不是用户输入的值(自己算出来)
        form.instance.oid = datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000,9999))

        #固定设置管理员ID
        form.instance.admin_id = request.session["info"]["id"]

        # 保存到数据库中
        form.save()
        return JsonResponse({"status":True})
    return JsonResponse({"status":False,'error':form.errors})

def order_delete(request):
    """删除订单"""
    uid = request.GET.get('uid')
    exists = models.Order.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status":False,'error':"删除失败，数据不存在"})

    models.Order.objects.filter(id=uid).delete()
    return JsonResponse({"status":True})

def order_detail(request):
    """根据ID获取订单详细"""
    uid = request.GET.get('uid')
    row_dict = models.Order.objects.filter(id=uid).values("title","price","status").first()
    if not row_dict:
        return JsonResponse({"status":False,'error':"数据不存在"})

    #从数据库中获取一个对象 row_object
    result = {
        "status":True,
        "data":row_dict
    }
    return JsonResponse(result)

@csrf_exempt
def order_edit(request):
    """编辑订单"""
    uid = request.GET.get('uid')
    row_object = models.Order.objects.filter(id=uid).first()
    if not row_object:
        return JsonResponse({"status":False,'tips':"数据不存在，请刷新重试"})

    form = OrderModelForm(data=request.POST,instance=row_object)
    if form.is_valid():
        form.save()
        return JsonResponse({"status":True})

    return JsonResponse({"status":False,'error':form.errors})














