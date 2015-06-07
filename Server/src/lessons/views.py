from django.shortcuts import render
from src.profiles.models import Lesson

# Create your views here.
def all_lessons(request):
    lessons = Lesson.objects.all()
    return render(request, 'lessons.html', locals())


