from django.conf import settings
import hashlib

def md5(data_string):

    #方式1：加密盐
    # salt = "xxxxxxxxx"
    # obj = hashlib.md5(salt)

    #方式2：Django settings 自带的加密 SECRET_KEY = 'h2yfx)bs*1)i&@b_ht!lk*4%-=j)wbf#ykb&9k87n_74+$%u_s'
    obj = hashlib.md5(settings.SECRET_KEY.encode('utf-8'))
    obj.update(data_string.encode('utf-8'))
    return obj.hexdigest()

