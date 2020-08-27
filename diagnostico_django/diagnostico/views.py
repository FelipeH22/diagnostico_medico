from django.shortcuts import render

# Create your views here.
from .models import Enfermedad
from .forms import ConsultaForm
from register.models import Registro
from django.db.models import Q

#Servicio
from .serializers import EnfermedadSerializer
from rest_framework import viewsets

def enfermedades(request):
    queryset = request.GET.get("listar")
    enfermedades = Enfermedad.objects.all()
    if queryset:
        enfermedades = enfermedades.filter(
            Q(nombre__icontains = queryset) |
            Q(descripcion__icontains = queryset)|
            Q(tratamiento__icontains = queryset)|
            Q(section__icontains = queryset)
        )
    else:
        enfermedades=[]
    contexto = {'enfermedades':enfermedades}
    return render(request, 'diagnostico/diagnostico.html',contexto)

def resultado(request):
    return render(request, "diagnostico/resultado.html")

def consuta_diagnostico(request):
    queryset = request.GET.get("buscar")
    enfermedades = Enfermedad.objects.all()
    if queryset:
        enfermedades = enfermedades.filter(
            Q(nombre__icontains = queryset) |
            Q(descripcion__icontains = queryset)|
            Q(tratamiento__icontains = queryset)|
            Q(section__icontains = queryset)
        )
    else:
        enfermedades=[]
    contexto = {'busqueda':enfermedades}
    return render(request, "diagnostico/consulta.html", contexto)



class EnfermedadViewSet(viewsets.ModelViewSet):
    queryset = Enfermedad.objects.all()
    serializer_class = EnfermedadSerializer