__author__ = 'Fyfar'
from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^', 'lessons.views.all_lessons', name='all_lessons'),

)
