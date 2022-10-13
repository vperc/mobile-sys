from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import HttpResponse,redirect,HttpResponseRedirect

class AuthMiddleware(MiddlewareMixin):

    def process_request(self,request):
        if request.path_info in ["/login/","/image/code/"]:
            return

        #1.读取当前用户的session信息,如果能读到说明已登录过,就可以往后走
        info_dict = request.session.get("info")
        if info_dict:
            return

        #2,没有登录过,重新返回登录界面
        #return redirect('/login/')
        return HttpResponseRedirect('/login/',)