from .models import Enfermedad
from rest_framework import serializers

class EnfermedadSerializer(serializers.ModelSerializer):
  class Meta:
    model = Enfermedad
    fields = '__all__'