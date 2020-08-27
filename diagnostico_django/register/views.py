from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect

# Create your views here.
def registro(request):
    return render(request, "register/registro.html")


def login_view(request):
    """Login view."""
    if request.method == 'POST':
        correo = request.POST['correo']
        user = authenticate(request, correo=correo)
        if user:
            login(request, user)
            return redirect('diagnostico')
        else:
            return render(request, 'users/login.html', {'error': 'Invalid username and password'})
    return render(request, 'register/login.html')