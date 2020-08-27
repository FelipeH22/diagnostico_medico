from django.shortcuts import render, HttpResponse

# Create your views here.
def home(request):
    return render(request, "core/index.html")

def diagnostico(request):
    return render(request, "core/diagnostico.html")

def consuta_diagnostico(request):
    return render(request, "core/consulta.html")

