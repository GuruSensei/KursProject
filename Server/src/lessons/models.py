from django.contrib.auth.models import User
from django.db import models

# Create your models here.
from src.profiles.models import Lesson


class Notification(models.Model):
    is_delivered = models.BooleanField(initial=False, verbose_name='Доставлено?')
    user = models.ForeignKey(User, verbose_name='Пользователь')
    lesson = models.ForeignKey(Lesson, verbose_name='Предмет')
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name='Время добавления')

