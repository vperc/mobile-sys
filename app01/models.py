# encoding=utf-8
import json
import redis
from functools import wraps
from django_redis import get_redis_connection
from django.db import models
#  缓存装饰器
_cache = get_redis_connection('default')
def cache(func):
    @wraps(func)
    def wrapper(obj,*args):
        key = args[0]
        value = _cache.get(key)
        if value:
            return json.loads(value)
        rs = func(obj,*args)
        _cache.set(key,json.dumps(rs))
        return rs
    return wrapper

class Admin(models.Model):
    """ 管理员 """
    username = models.CharField(verbose_name="用户名", max_length=32)
    password = models.CharField(verbose_name="密码", max_length=64)

    def __str__(self):
        return self.username

class Department(models.Model):
    """部门表"""
    title = models.CharField(verbose_name='标题',max_length=32)

    def __str__(self):
        return self.title

    @classmethod
    @cache
    def get(cls,id):
        rs = cls.objects.get(id=id)
        return {
            'title':rs.title,
        }

class UserInfo(models.Model):
    """员工表"""
    name = models.CharField(verbose_name="姓名", max_length=32)
    password = models.CharField(verbose_name="密码", max_length=64)
    age = models.IntegerField(verbose_name='年龄')
    account = models.DecimalField(verbose_name='账户余额', max_digits=10, decimal_places=2, default=0)
    create_time = models.DateTimeField(verbose_name='入职时间')
    gender_choices = {
        (1, "男"),
        (2, "女"),
    }
    gender = models.SmallIntegerField(verbose_name="性别", choices=gender_choices)
    depart = models.ForeignKey(verbose_name="部门",to="Department",to_field="id",on_delete=models.CASCADE)

class PrettyNum(models.Model):
    """靓号表"""
    mobile = models.CharField(verbose_name="手机号",max_length=11)
    #想要允许为空 null=True , blank=Ture
    price = models.IntegerField(verbose_name="价格",default=0)

    level_choices = (
        (1,"1级"),
        (2,"2级"),
        (3,"3级"),
        (4,"4级"),
    )
    level = models.SmallIntegerField(verbose_name="级别",choices=level_choices,default=1)

    status_choices = (
        (1,"已占用"),
        (2,"未占用"),

    )
    status = models.SmallIntegerField(verbose_name="状态",choices=status_choices,default=2)

class Task(models.Model):
    """任务"""
    level_choices = (
        (1,"紧急"),
        (2,"重要"),
        (3,"临时"),
    )
    level = models.SmallIntegerField(verbose_name="级别",choices=level_choices,default=1)
    title = models.CharField(verbose_name="标题",max_length=64)
    detail = models.TextField(verbose_name="详细信息")

    # user_id
    user = models.ForeignKey(verbose_name="负责人",to="Admin",on_delete=models.CASCADE)

class Order(models.Model):
    """工单"""
    oid = models.CharField(verbose_name="订单号",max_length=64)
    title = models.CharField(verbose_name="名称",max_length=32)
    price = models.IntegerField(verbose_name="价格")

    status_choices = {
        (1,"待支付"),
        (2,"已支付"),
    }

    status = models.SmallIntegerField(verbose_name="状态",choices=status_choices,default=1)
    admin = models.ForeignKey(verbose_name="管理员",to="Admin", on_delete=models.CASCADE)

class Boss(models.Model):
    """老板"""
    name = models.CharField(verbose_name="姓名",max_length=32)
    age = models.IntegerField(verbose_name="年龄")
    img = models.CharField(verbose_name="头像", max_length=128)

class City(models.Model):
    """城市"""
    name = models.CharField(verbose_name="名称",max_length=32)
    count = models.IntegerField(verbose_name="人口")
    #本质上数据也是CharField,自动保存数据。
    img = models.FileField(verbose_name="Logo",max_length=128,upload_to='city/')

# file：models.py
class MyModel(models.Model):
    # file will be saved to MEDIA_ROOT/uploads/2015/01/30
    upload = models.FileField(upload_to='uploads/%Y/%m/%d/')


# if __name__ == '__main__':
#     try:
#         rs = redis.Redis()
#     except Exception as e:
#         print(e)
#
#     result = rs.set('name','itcast')
#     print(result)
# 
#









