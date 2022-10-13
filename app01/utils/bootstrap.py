from django import forms


class BootStrap:
    bootstrap_exclude_fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        #循环ModelForm中所有的字段,给每个字段的插件设置
        for name, field in self.fields.items():
            if name in self.bootstrap_exclude_fields:
                continue
            #字段中有属性,保存原来的属性,没有属性,才增加。
            if field.widget.attrs:
               field.widget.attrs["class"] = "form-control"
               field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {
                    "class": "form-control",
                    "placeholder": field.label,
                }

class BootStrapModelForm(BootStrap,forms.ModelForm):
    bootstrap_exclude_fields = []

    def _html_output(self, normal_row, error_row, row_ender, help_text_html, errors_on_separate_row):
        pass

class BootStrapForm(BootStrap,forms.Form):
    pass
