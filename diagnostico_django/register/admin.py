from django.contrib import admin
from .models import Registro

# Register your models here.
class RegistroAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')

admin.site.register(Registro, RegistroAdmin)