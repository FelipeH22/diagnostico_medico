from django.shortcuts import render
from .models import Enfermedad
from .forms import ConsultaForm
# Create your views here.


def enfermedades(request):
    enfermedades = Enfermedad.objects.all()
    contexto = {'enfermedades':enfermedades}
    return render(request, 'diagnostico/diagnostico.html',contexto)

def resultado(request):
    return render(request, "diagnostico/resultado.html")

def consuta_diagnostico(request):
    consulta_form = ConsultaForm()
    contexto = {'form':consulta_form}
    return render(request, "diagnostico/consulta.html",contexto)