from django.db import models

# Create your models here.
class Enfermedad(models.Model):
    nombre = models.CharField(max_length=200, verbose_name="nombre enfermedad")
    descripcion = models.TextField(verbose_name="descripción")
    tratamiento = models.TextField(verbose_name="tratamiento")
    section = models.CharField(max_length=200, verbose_name="sección del cuerpo")
    created = models.DateField(auto_now_add = True, verbose_name="Fecha de creación")
    updated = models.DateField(auto_now = True, verbose_name="Fecha de modificación")

    class Meta:
        verbose_name = 'enfermedad'
        verbose_name_plural = 'enfermedades'
        ordering = ('')

    def __str__(self):
        return self.nombre