__author__ = 'Fyfar'
from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^login/', 'loginsys.views.login', name='auth_login'),
    url(r'^logout/', 'loginsys.views.logout', name='auth_logout'),
    url(r'^register/', 'loginsys.views.register', name='auth_register'),
)