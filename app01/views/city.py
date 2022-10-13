from django.shortcuts import render, HttpResponse, redirect
from app01 import models
from app01.views.upload import UpModelForm
from app01.utils.pagination import Pagination

def city_list(request):
    """城市列表"""
    data_dict = {}
    search_data = request.GET.get('q', "")
    if search_data:
        data_dict["name__contains" and "count__contains"] = search_data

    queryset = models.City.objects.filter(**data_dict).order_by("-id")

    page_object = Pagination(request,queryset,page_size=4)

    context = {
        "queryset": page_object.page_queryset,
        "search_data":search_data,
        "page_string":page_object.html(),
    }

    return render(request, 'city_list.html' , context)

def city_add(request):
    title = "新建城市"

    if request.method == "GET":
        form = UpModelForm()
        return render(request, 'upload_form.html', {'form': form, 'title': title})

    form = UpModelForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect("/city/list/")
    return render(request, 'upload_form.html', {'form': form, 'title': title})

def city_edit(request,nid):
  """修改城市"""

  city_object = models.City.objects.filter(id=nid).first()
  title = "修改城市"

  if request.method == "GET":
      form = UpModelForm(instance=city_object)
      return render(request, 'upload_form.html', {'form': form, 'title': title})

  form = UpModelForm(data=request.POST, files=request.FILES,instance=city_object)
  if form.is_valid():
      form.save()
      return redirect("/city/list/")

  return render(request, 'upload_form.html', {'form': form, 'title': title})

def city_delete(request,nid):
  """删除城市"""
  models.City.objects.filter(id=nid).delete()
  #重定向回城市表
  return redirect("/city/list/")