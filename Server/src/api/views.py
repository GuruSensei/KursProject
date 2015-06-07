from django.shortcuts import HttpResponse, get_list_or_404, get_object_or_404
from src.profiles.models import Lesson, Post, User
import json

# Create your views here.
def get_users(request):
    users = User.objects.all()
    info = {'teachers': [], 'count': len(users)}
    for user in users:
        info['teachers'].append({'full_name': user.get_full_name(),
                                 'username': user.get_username(),
                                 'is_staff': str(user.is_staff)})
    return HttpResponse(json.dumps(info,
                                   indent=4,
                                   sort_keys=True,
                                   ensure_ascii=False),
                        content_type='application/json')

def get_lessons(request):
    info = {'lessons':[]}
    if 'user' in request.GET:
        user = get_object_or_404(User, username=request.GET['user'])
        lessons = get_list_or_404(Lesson, teacher=user)
    else:
        lessons = get_list_or_404(Lesson)

    for lesson in lessons:
        info['lessons'].append({
            'id': lesson.id,
            'name': lesson.lessons,
            'teacher': {
                'full_name': lesson.teacher.get_full_name(),
                'username': lesson.teacher.get_username(),
                },
        })
        info['count'] = len(lessons)
    return HttpResponse(json.dumps(info,
                                   indent=4,
                                   sort_keys=True,
                                   ensure_ascii=False),
                        content_type='application/json')

def get_posts(request):
    info = {'posts':[]}
    if 'user' in request.GET:
        user = get_object_or_404(User, username=request.GET['user'])
        posts = get_list_or_404(Post, author=user)
    else:
        posts = get_list_or_404(Post)

    for post in posts:
        info['posts'].append({
            'created': post.created.strftime("%Y-%m-%d %H:%M:%S"),
            'message': post.messages,
            'addressee': post.addressee,
            'author': {
                'full_name': post.author.get_full_name(),
                'username': post.author.get_username(),
                },
        })
        info['count'] = len(posts)
    return HttpResponse(json.dumps(info,
                                   indent=4,
                                   sort_keys=True,
                                   ensure_ascii=False),
                        content_type='application/json')