from django.shortcuts import render, redirect
from django.contrib import auth
from .forms import CustomCreationForm


def login(request):
    if request.POST:
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')

        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            return redirect('profile')
        else:
            login_error = 'Пользователь не найден'
            return render(request, 'registration/login.html', locals())
    else:
        return render(request, 'registration/login.html', locals())

def logout(request):
    auth.logout(request)
    return redirect('home')

def register(request):
    newuser_form = CustomCreationForm(request.POST or None)
    if newuser_form.is_valid():
        newuser_form.save()

        username = newuser_form.cleaned_data['username']
        password = newuser_form.cleaned_data['password2']

        new_user = auth.authenticate(username=username, password=password)
        auth.login(request, new_user)
        return redirect('profile')
    return render(request, 'registration/register.html', locals())