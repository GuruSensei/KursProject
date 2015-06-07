from django.shortcuts import render, redirect, Http404
from django.contrib.auth.decorators import login_required
from django.db.models import ObjectDoesNotExist
from django.core.paginator import Paginator
from .models import Post, MediaModel
from .forms import UploadFilesForm

# Create your views here.

@login_required
def profile(request, page_number=1):
    posts = Post.objects.filter(author=request.user).order_by('-created')
    paginator = Paginator(posts, 3)
    current_page = paginator.page(page_number)
    return render(request, 'profile.html', locals())

@login_required
def write_message(request):
    if 'message' in request.POST:
        post = Post(author = request.user,
                messages = request.POST['message'],
                addressee = request.POST['addressee'])
        post.save()

    return redirect('profile')

@login_required
def delete_message(request, post_id):
    try:
        Post.objects.get(pk=post_id).delete()
    except ObjectDoesNotExist:
        return Http404
    return redirect('profile')

def upload_files(request):
    form = UploadFilesForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        new_file = MediaModel(media_file=request.FILES['file'])
        new_file.save()

    user_files = MediaModel.objects.all()
    return render(request, 'upload_page.html', locals())