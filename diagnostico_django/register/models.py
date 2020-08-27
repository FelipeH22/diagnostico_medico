from django.db import models

# Create your models here.

class Registro (models.Model):
    nombre = models.CharField(max_length=200, verbose_name="Nombre")
    edad = models.IntegerField(verbose_name="Edad")
    peso = models.DecimalField(max_digits=4, decimal_places=2, verbose_name="Peso")
    altura = models.DecimalField(max_digits=4, decimal_places=2, verbose_name="Estatura")
    correo = models.EmailField(max_length=254, verbose_name="Correo")
    created = models.DateField(auto_now_add = True, verbose_name="Fecha de creación")
    updated = models.DateField(auto_now = True, verbose_name="Fecha de modificación")

    class Meta:
        verbose_name = 'registro'
        verbose_name_plural = 'registros'
        ordering = ('')

    def __str__(self):
        return self.nombre

