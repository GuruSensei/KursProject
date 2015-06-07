__author__ = 'Stas Tomych <stas.tomich@gmail.com>'
__data__ = ''
__time__ = '20:53'

from django import forms
from .models import Lesson

class MessageForm(forms.Form):
    message = forms.CharField(max_length=256, label='Сообщение')
    addressee = forms.CharField(max_length=120, label='Кому отправить (по умолчанию всем участникам)', required=False)


class UploadFilesForm(forms.Form):
    file = forms.FileField(
        label='Выберите файл',
        help_text='Максимальный размер 20 мб'
    )