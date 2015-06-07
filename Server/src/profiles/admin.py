from django.contrib import admin
from .models import Lesson, Post


class PostsAdmin(admin.ModelAdmin):
    list_display = ('author', 'messages', 'created',)
    list_filter = ('created',)


admin.site.register(Lesson)
admin.site.register(Post, PostsAdmin)