__author__ = 'Fyfar'

from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User

class CustomCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, label='Имя')
    last_name = forms.CharField(max_length=30, label='Фамилия')

    def save(self, commit=True):
        data = self.cleaned_data
        new_user = User.objects.create_user(username=data['username'],
                                            password=data['password2'])
        new_user.first_name = data['first_name']
        new_user.last_name = data['last_name']
        new_user.save()