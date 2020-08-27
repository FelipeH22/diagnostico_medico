from django.contrib import admin
from .models import Enfermedad

# Register your models here.
class EnfermedadAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')

admin.site.register(Enfermedad, EnfermedadAdmin)