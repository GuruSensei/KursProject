__author__ = 'Fyfar'

from django.conf.urls import patterns, url

urlpatterns = patterns('',
    # Examples:
    url(r'^users/$', 'api.views.get_users', name='get_users'),
    url(r'^lessons/$', 'api.views.get_lessons', name='get_lessons'),
    url(r'^posts/$', 'api.views.get_posts', name='get_posts'),

)