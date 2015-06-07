from django.db import models
from django.contrib.auth.models import User


class Lesson(models.Model):
    teacher = models.ForeignKey(User, related_name='lesson_teacher')
    lessons = models.CharField(max_length = 100, verbose_name = 'Название предмета')
    users = models.ManyToManyField(User, related_name='lesson_users')

    def __str__(self):
        return str(self.lessons)


class Post(models.Model):
    author = models.ForeignKey(User, verbose_name='Автор')
    messages = models.CharField(max_length=256, verbose_name='Сообщение')
    created = models.DateTimeField(auto_now_add=True, auto_now=False, verbose_name='Создано')
    updated = models.DateTimeField(auto_now_add=False, auto_now=True, verbose_name='Обновлено')
    addressee = models.CharField(max_length=256, default='all', verbose_name='Кому отправить')

    def __str__(self):
        return '%s %s' % (self.author.first_name, self.author.last_name)


class MediaModel(models.Model):
    media_file = models.FileField(upload_to='user_media/')