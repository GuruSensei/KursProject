from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^profile/$', 'profiles.views.profile', name='profile'),
    url(r'^send_message/$', 'profiles.views.write_message', name='send'),
    url(r'^delete_message/(?P<post_id>\d+)/$', 'profiles.views.delete_message', name='delete'),
    url(r'^upload/$', 'profiles.views.upload_files', name='upload_page'),
    url(r'^page/(\d+)/$', 'profiles.views.profile', name='page'),
    url(r'^auth/', include('loginsys.urls')),
    url(r'^api/', include('api.urls')),
    url(r'^lessons/', include('lessons.urls')),
    url(r'^$', 'django_server.views.home', name='home'),
    url(r'^admin/', include(admin.site.urls)),

)

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root = settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL,
                          document_root = settings.MEDIA_ROOT)