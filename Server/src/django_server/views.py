from django.shortcuts import render
try:
    from feeds import get_feeds
except ImportError:
    from src.feeds import get_feeds


def home(request):
    posts = get_feeds()
    return render(request, 'index.html', locals())