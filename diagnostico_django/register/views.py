from django.shortcuts import render

# Create your views here.
def registro(request):
    return render(request, "register/registro.html")